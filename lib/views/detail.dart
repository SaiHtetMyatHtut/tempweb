import 'package:better_web_v2/constants/theme_colors.dart';
import 'package:better_web_v2/controllers/table_toggle_controller.dart';
import 'package:better_web_v2/controllers/user_detail_controller.dart';
import 'package:better_web_v2/models/datatable.dart';
import 'package:better_web_v2/services/datatable_api.dart';
import 'package:better_web_v2/widgets/betting_table.dart';
import 'package:better_web_v2/widgets/table_toggle.dart';
import 'package:better_web_v2/widgets/user_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Detail extends StatelessWidget {
  Detail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TableToggleController _c = Get.put(TableToggleController());
    UserDetailController _uc = Get.put(UserDetailController());
    return SafeArea(
        child: Scaffold(
            body: Row(children: [
      Expanded(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 150),
              child: Column(children: [
                const SizedBox(height: 70),
                Container(
                  width: 150,
                  height: 150,
                  decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0, 0),
                            spreadRadius: 3,
                            blurRadius: 1)
                      ],
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage('https://picsum.photos/200/300'),
                          fit: BoxFit.fill)),
                ),
                const SizedBox(height: 50),
                const Text(
                  //Get.arguments['id'].name,
                  'Sai Htet Myat Htit',
                  style: TextStyle(fontSize: 24),
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    attributeWidget(),
                    const SizedBox(
                      width: 20,
                    ),
                    attributeWidget()
                  ],
                ),
                const SizedBox(height: 25),
                Expanded(
                    child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        _uc.setUserIndex(index);
                      },
                      child: const UserCard(1, 'SAI', '2D', 'User')),
                ))
              ]))),
      Expanded(
          child: Obx(() => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _uc.userIndex.value == 0
                      ? const Text('Zero')
                      : const Text('data'),
                  const TableToggle(['Weekly', 'Daily']),
                  const SizedBox(height: 20),
                  Obx(() => _c.toggleIndex.value == 0
                      ? getUserDataTable()
                      : BettingTable(allUsersDaily)),
                  const SizedBox(height: 20),
                  tableSummery()
                ],
              )))
    ])));
  }

  attributeWidget() {
    return Container(
      width: 60,
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: ThemeColors.milky,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const TextField(
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 14),
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixText: 'x',
        ),
      ),
    );
  }

  getUserDataTable() => StreamBuilder<List<TableData>>(
        initialData: const <TableData>[],
        stream: DataTableAPI.getTable(22),
        builder: (context, snapshot) {
          var data = snapshot.data;
          final allUsersWeekly = List.generate(
            snapshot.data!.length,
            (index) => User(
                day: data![index].timeStamp,
                lNumber: data[index].luckNum,
                amount: data[index].amount,
                p: data[index].poukTee),
          );

          return BettingTable(allUsersWeekly);
        },
      );

  final allUsersDaily = <User>[
    const User(day: 'Emma', lNumber: 'Field', amount: '37', p: '1000'),
  ];

  tableSummery() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      width: 480,
      height: 100,
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
      child: Row(
        children: [
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [summartText('Agent Cut', '15%'), const Text('')],
          )),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              summartText('Total Refund', '1000000'),
              summartText('Total Earn', '850000')
            ],
          ))
        ],
      ),
    );
  }

  summartText(label, amount) {
    return Row(
      children: [
        Expanded(
            child: Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        )),
        Expanded(child: Text(amount)),
      ],
    );
  }
}
