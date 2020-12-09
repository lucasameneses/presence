import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pages/initialPage.dart';
import 'stores/controller.dart';

void main() {
  Get.changeTheme(ThemeData.dark());
  Get.lazyPut(() => PresenceController());
  runApp(GetMaterialApp(
    home: InitialPage(),
  ));
}
