import 'package:flutter/material.dart';
import 'package:getx_api_app/screens/home_screen.dart';
import 'package:getx_api_app/screens/loader_screen.dart';

class StartupScreen extends StatelessWidget {
  const StartupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("StartupScreen"),
      ),
      body: Center(
        child: Container(
          child: ElevatedButton(
            child: Text("weiter"),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => LoaderScreen()));
            },
          ),
        ),
      ),
    );
  }
}
