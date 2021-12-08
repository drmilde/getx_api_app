import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api_app/screens/themes/theme/theme_constants.dart';

class ThemeController extends GetxController {
  var themes = List<ThemeData>.empty().obs;
  var current = 0.obs;

  get currentThemeData => themes[current.value];

  void setCurrent(int index) {
    index = index.abs();
    if (index >= themes.length) {
      current.value = 0;
    } else {
      current.value = index;
    }
    // bei Nutzung GetxBuilder statt Obx: update();
  }

  void addThemeData(ThemeData themeData) {
    themes.add(themeData);
  }

  @override
  void onInit() {
    addThemeData(lightTheme);
    addThemeData(darkTheme);
  }
}
