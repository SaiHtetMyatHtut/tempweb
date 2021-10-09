import 'package:better_web_v2/views/detail.dart';
import 'package:get/get.dart';
import 'package:better_web_v2/views/home.dart';

class Routes {
  static final List<GetPage> routes = [
    GetPage(name: '/Home', page: () => const Home()),
    GetPage(name: '/Details', page: () => Detail()),
  ];
}
