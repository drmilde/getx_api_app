import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeManager with ChangeNotifier {

  ThemeMode _themMode = ThemeMode.light;
  ThemeMode get themMode => _themMode;


  void toggleTheme(bool isDark) {
    _themMode = isDark? ThemeMode.dark: ThemeMode.light;
    notifyListeners();
  }
}