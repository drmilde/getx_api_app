import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api_app/screens/themes/theme/theme_constants.dart';

import 'controller/theme_controller.dart';
import 'screens/startup_screen.dart';

void main() {
  runApp(const MyApp());
}

// Hier wird der zentrale ThemeController erzeugt
ThemeController themeController = Get.put(ThemeController());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'GetX-API',
        theme: themeController.currentThemeData,
        home: StartupScreen(),
      );
    });
  }
}
