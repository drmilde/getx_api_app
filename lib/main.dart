import 'package:flutter/material.dart';
import 'package:getx_api_app/screens/themes/theme/theme_constants.dart';
import 'package:getx_api_app/screens/themes/theme/theme_manager.dart';

import 'screens/startup_screen.dart';

void main() {
  runApp(const MyApp());
}

ThemeManager _themeManager = ThemeManager();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GetX-API',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode:  _themeManager.themMode,
      home: StartupScreen(themeManager: _themeManager,),
    );
  }
}


