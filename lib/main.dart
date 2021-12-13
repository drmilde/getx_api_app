import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/theme_controller.dart';
import 'screens/startup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    // etc.
  };
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
        scrollBehavior: MyCustomScrollBehavior(),
        title: 'GetX-API',
        theme: themeController.currentThemeData,
        home: StartupScreen(),
      );
    });
  }
}
