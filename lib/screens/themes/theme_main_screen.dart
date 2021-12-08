import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api_app/controller/theme_controller.dart';

import 'getx_theme_screen.dart';

ThemeController themeController = Get.find();

class ThemeMainScreen extends StatefulWidget {
  ThemeMainScreen({Key? key}) : super(key: key);

  @override
  State<ThemeMainScreen> createState() => _ThemeMainScreenState();
}

class _ThemeMainScreenState extends State<ThemeMainScreen> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("MainScreen"),
          actions: [
            Obx(() {
              return Switch(
                  value: themeController.current != 0,
                  onChanged: (v) {
                    setState(() {
                      isDark = v;
                      if (isDark)
                        themeController.setCurrent(1);
                      else
                        themeController.setCurrent(0);
                    });
                  });
            })
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                    "https://static.wikia.nocookie.net/bigbangtheory/images/d/d8/114925_0871b_FULL.jpg/revision/latest?cb=20190509180529"),
                _spacer(16),
                Text("Ein Text"),
                _spacer(16),
                Text("Noch ein Text"),
                _spacer(16),
                TextField(),
                _spacer(16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => GetxThemeScreen()));
                  },
                  child: Text("hier, bitte"),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Widget _spacer(double height) {
    return SizedBox(
      height: height,
    );
  }
}
