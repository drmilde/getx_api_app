import 'package:flutter/material.dart';

import 'screens/startup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GetX-API',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StartupScreen(),
    );
  }
}


