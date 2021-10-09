import 'package:get/get.dart';

class UserDetailController extends GetxController {
  var userIndex = 0.obs;
  setUserIndex(index) {
    userIndex.value = index;
  }
}
