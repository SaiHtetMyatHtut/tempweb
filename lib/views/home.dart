import 'package:better_web_v2/constants/items.dart';
import 'package:better_web_v2/constants/theme_colors.dart';
import 'package:better_web_v2/models/profit.dart';
import 'package:better_web_v2/models/user_model.dart';
import 'package:better_web_v2/services/profit_api.dart';
import 'package:better_web_v2/services/user_api.dart';
import 'package:better_web_v2/views/detail.dart';
import 'package:better_web_v2/widgets/category_app_bar.dart';
import 'package:better_web_v2/widgets/overview.dart';
import 'package:better_web_v2/widgets/search_bar.dart';
import 'package:better_web_v2/widgets/user_card.dart';
import 'package:better_web_v2/widgets/weekly_profit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Row(
          children: [
            Expanded(flex: 1, child: Container(color: Colors.blueAccent)),
            Expanded(flex: 3, child: userListColumn()),
            Expanded(flex: 3, child: detailColumn()),
            Expanded(flex: 1, child: Container(color: Colors.redAccent)),
          ],
        ),
      ),
    );
  }

  userListColumn() => Column(
        children: [
          const SizedBox(height: 80),
          CategoriesBar(Items.menuItem),
          const SizedBox(height: 35),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 60),
            child: SearchBar(),
          ),
          const SizedBox(height: 25),
          Expanded(child: userListBuilder())
        ],
      );
  userListBuilder() => StreamBuilder<List<User>>(
      initialData: const <User>[],
      stream: UserAPI.getUser(),
      builder: (context, snapshot) => ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Get.to(() => Detail(),
                    arguments: {'id': snapshot.data![index]});
              },
              child: UserCard(
                snapshot.data![index].id,
                snapshot.data![index].name,
                snapshot.data![index].gameName,
                snapshot.data![index].typeName,
              ))));

  detailColumn() => Column(
        children: [
          const SizedBox(height: 140),
          const Text('Profit OverView',
              style: TextStyle(
                  color: ThemeColors.gray,
                  fontSize: 24,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 50),
          profitOverView(),
          const SizedBox(height: 30),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70),
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) => Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 80),
                    child: const WeeklyProfit())),
          ))
        ],
      );

  profitOverView() => StreamBuilder<Profit>(
        initialData: Profit(totalIncome: 0, totalProfit: 0, totalRefund: 0),
        stream: ProfitAPI.getProfit(),
        builder: (context, snapshot) => Overview(
            snapshot.data!.totalIncome.toString(),
            snapshot.data!.totalRefund.toString(),
            snapshot.data!.totalProfit.toString()),
      );
}
