// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:better_web_v2/routes/routes.dart';

void main() {
  window.document.onContextMenu.listen((evt) => evt.preventDefault());
  runApp(GetMaterialApp(
    initialRoute: '/Home',
    getPages: Routes.routes,
  ));
}
