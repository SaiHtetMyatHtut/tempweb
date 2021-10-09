import 'package:get/get.dart';

class TableToggleController extends GetxController {
  var toggleIndex = 0.obs;
  setToggleIndex(index) {
    toggleIndex.value = index;
  }
}
