import 'package:better_web_v2/constants/theme_colors.dart';
import 'package:flutter/material.dart';

class WeeklyProfit extends StatelessWidget {
  const WeeklyProfit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade400,
                offset: const Offset(0, 0),
                blurRadius: 1,
                spreadRadius: 0)
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  '18254 MMK',
                  style: TextStyle(
                    fontSize: 24,
                    // fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Weekly Record',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(175, 175, 189, 1)),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Text(
                  'Win',
                  style: TextStyle(fontSize: 16, color: Colors.greenAccent),
                ),
                SizedBox(height: 8),
                Text(
                  'More',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: ThemeColors.oriange),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
