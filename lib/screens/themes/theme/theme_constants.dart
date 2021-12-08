import 'package:flutter/material.dart';

const COLOR_PRIMARY = Colors.deepOrangeAccent;
const COLOR_FAB_LIGHT = Colors.orange;

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      backgroundColor: COLOR_PRIMARY,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: COLOR_FAB_LIGHT,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color?>(COLOR_PRIMARY),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry?> (
            EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          ),
          shape: MaterialStateProperty.all<OutlinedBorder?> (
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              )
          )
      ),
    ));

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
);
