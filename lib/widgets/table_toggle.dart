import 'package:better_web_v2/constants/theme_colors.dart';
import 'package:better_web_v2/controllers/table_toggle_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TableToggle extends StatelessWidget {
  final List<String> title;

  const TableToggle(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TableToggleController _toggleController =
        Get.put(TableToggleController());
    return Container(
      padding: const EdgeInsets.all(5),
      height: 55,
      child: Obx(() => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: title
                .asMap()
                .map((key, value) => MapEntry(
                    key,
                    GestureDetector(
                        onTap: () {
                          _toggleController.setToggleIndex(key);
                        },
                        child: itemButton(value, key))))
                .values
                .toList(),
          )),
    );
  }

  Widget itemButton(text, index) {
    final TableToggleController _toggleController =
        Get.put(TableToggleController());
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: 100,
      height: 55,
      child: Center(
          child: Text(
        text,
        style: TextStyle(
            color: _toggleController.toggleIndex.value == index
                ? Colors.white
                : Colors.black,
            fontWeight: FontWeight.bold),
      )),
      decoration: BoxDecoration(
        color: _toggleController.toggleIndex.value == index
            ? ThemeColors.oriange
            : ThemeColors.milky,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
