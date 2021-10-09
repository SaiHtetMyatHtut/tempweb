import 'dart:convert';

import 'package:better_web_v2/constants/table_configs.dart';
import 'package:better_web_v2/constants/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BettingTable extends StatelessWidget {
  final List<User> tabledata;

  const BettingTable(this.tabledata, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 0,
            blurRadius: 4,
          )
        ],
      ),
      child: TableChart(tabledata),
    );
  }
}

// ignore: must_be_immutable
class TableChart extends StatefulWidget {
  late List<User> users;

  TableChart(this.users, {Key? key}) : super(key: key);

  @override
  State<TableChart> createState() => _TableChartState();
}

class _TableChartState extends State<TableChart> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final columns = TableConfigs.title;
    return DataTable(
      columns: getColumns(columns),
      rows: getRows(widget.users),
    );
  }

  List<DataColumn> getColumns(List<String> columns) {
    return columns.map((String column) {
      return DataColumn(
          label: Text(column,
              style: const TextStyle(
                  color: ThemeColors.oriange, fontWeight: FontWeight.bold)));
    }).toList();
  }

  List<DataRow> getRows(List<User> users) {
    return users.map((User user) {
      final cells = [user.day, user.lNumber, user.amount, user.p];
      return DataRow(
          cells: modelBuilder(
              cells,
              (index, cell) => DataCell(Text('$cell'), onTap: () {
                    showTextDialog(context, title: 'Editing Row', user: user);
                  })));
    }).toList();
  }

  List<T> modelBuilder<M, T>(
          List<M> models, T Function(int index, M model) builder) =>
      models
          .asMap()
          .map<int, T>((index, model) => MapEntry(index, builder(index, model)))
          .values
          .toList();
}

class User {
  final String day;
  final String lNumber;
  final String amount;
  final String p;

  const User({
    required this.day,
    required this.lNumber,
    required this.amount,
    required this.p,
  });

  User copy({
    String? day,
    String? lNumber,
    String? amount,
    String? p,
  }) =>
      User(
        day: day ?? this.day,
        lNumber: lNumber ?? this.lNumber,
        amount: amount ?? this.amount,
        p: p ?? this.p,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          day == other.day &&
          lNumber == other.lNumber &&
          amount == other.amount &&
          p == other.p;

  @override
  int get hashCode => day.hashCode ^ lNumber.hashCode ^ amount.hashCode;
}

Future<T?> showTextDialog<T>(
  BuildContext context, {
  required String title,
  required User user,
}) =>
    showDialog<T>(
      context: context,
      builder: (context) => TextDialogWidget(
        title: title,
        user: user,
      ),
    );

class TextDialogWidget extends StatefulWidget {
  final String title;
  final User user;

  const TextDialogWidget({
    Key? key,
    required this.title,
    required this.user,
  }) : super(key: key);

  @override
  _TextDialogWidgetState createState() => _TextDialogWidgetState();
}

class _TextDialogWidgetState extends State<TextDialogWidget> {
  late TextEditingController dayController;
  late TextEditingController lNumController;
  late TextEditingController amountController;
  late TextEditingController pController;

  @override
  void initState() {
    super.initState();

    dayController = TextEditingController(text: widget.user.day);
    lNumController = TextEditingController(text: widget.user.lNumber);
    amountController = TextEditingController(text: widget.user.amount);
    pController = TextEditingController(text: widget.user.p);
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
        title: Text(widget.title),
        content: SizedBox(
          width: 300,
          child: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              Form(
                // key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextFormField(
                      controller: dayController,
                      decoration: InputDecoration(
                          hintText: widget.user.day,
                          label: Text(dayController.text)),
                    ),
                    TextFormField(
                      controller: lNumController,
                      decoration: InputDecoration(
                          hintText: widget.user.lNumber,
                          label: Text(lNumController.text)),
                    ),
                    TextFormField(
                      controller: amountController,
                      decoration: InputDecoration(
                          hintText: widget.user.amount,
                          label: Text(amountController.text)),
                    ),
                    TextFormField(
                      controller: pController,
                      decoration: InputDecoration(
                          hintText: widget.user.p,
                          label: Text(pController.text)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          child: const Text('Cancel'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        ElevatedButton(
                          child: const Text('Done'),
                          onPressed: () {
                            http.post(
                              Uri.parse('http://localhost:5000/userdata/edit'),
                              headers: <String, String>{
                                'Content-Type': 'application/json',
                              },
                              body: jsonEncode(<String, String>{
                                'id': '22',
                                'type_id': '1',
                                'game_id': '1',
                                'time_stamp':
                                    widget.user.day == dayController.text
                                        ? widget.user.day
                                        : dayController.text,
                                'amount':
                                    widget.user.amount == amountController.text
                                        ? widget.user.amount
                                        : amountController.text,
                                'luck_num':
                                    widget.user.lNumber == lNumController.text
                                        ? widget.user.lNumber
                                        : lNumController.text,
                                'pouk_tee': widget.user.p == pController.text
                                    ? widget.user.p
                                    : pController.text
                              }),
                            );
                            Navigator.of(context).pop();
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
