import 'package:better_web_v2/constants/theme_colors.dart';
import 'package:flutter/material.dart';

class Overview extends StatelessWidget {
  final String totalIncome;
  final String totaRefund;
  final String totalProfit;
  const Overview(this.totalIncome, this.totaRefund, this.totalProfit,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: 310,
      // height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            offset: const Offset(0, 0),
            blurRadius: 2,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Current Profit',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text('Total',
                  style: TextStyle(fontSize: 14, color: ThemeColors.oriange))
            ],
          ),
          const SizedBox(height: 16),
          titleRow('Total Betted', '27,August,2021', totalIncome),
          const SizedBox(height: 7),
          titleRow('Total Refuned', '1,September 2021', totaRefund),
          const SizedBox(height: 7),
          titleRow('Profit', '1,January,2021', totalProfit)
        ],
      ),
    );
  }

  titleRow(title, date, amount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 7),
            Text(
              date,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        Text(
          amount + ' MMK',
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
