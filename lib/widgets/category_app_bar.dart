import 'package:better_web_v2/constants/theme_colors.dart';
import 'package:better_web_v2/controllers/tab_item_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesBar extends StatelessWidget {
  final List<PotatoCategoryItem> menuItem;
  final TabItemController controller = Get.put(TabItemController());
  CategoriesBar(this.menuItem, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 5, top: 30),
      padding: const EdgeInsets.symmetric(vertical: 10),
      height: 80,
      child: Obx(() => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: menuItem
                .asMap()
                .map((key, value) {
                  var isActive = false;
                  key == controller.curIndex.value
                      ? isActive = true
                      : isActive = false;
                  return MapEntry(
                    key,
                    GestureDetector(
                      onTap: () {
                        controller.setIndex(key);
                      },
                      child: PotatoCategoryItem(
                        value.icon,
                        value.text,
                        isActive: isActive,
                      ),
                    ),
                  );
                })
                .values
                .toList(),
          )),
    );
  }
}

class PotatoCategoryItem extends StatelessWidget {
  final bool isActive;
  final String text;
  final IconData icon;

  const PotatoCategoryItem(this.icon, this.text,
      {Key? key, this.isActive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: isActive ? 70 : 50,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: isActive ? ThemeColors.oriange : ThemeColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Icon(
              icon,
              color: isActive ? Colors.white : ThemeColors.gray,
            ),
          ),
          Text(
            isActive ? text : '',
            style: TextStyle(
              color: isActive ? Colors.white : ThemeColors.gray,
            ),
          ),
        ],
      ),
    );
  }
}
