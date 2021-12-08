import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api_app/controller/theme_controller.dart';

ThemeController themeController = Get.find();

class GetxThemeScreen extends StatelessWidget {
  GetxThemeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("GetX Theme Screen"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(() {
                return Container(
                    child: Text("aktuelles Theme: ${themeController.current}"));
              }),
              _spacer(16),
              ElevatedButton(
                child: Text("set theme 0"),
                onPressed: () {
                  themeController.setCurrent(0);
                },
              ),
              _spacer(16),
              ElevatedButton(
                child: Text("set theme 1"),
                onPressed: () {
                  themeController.setCurrent(1);
                },
              ),
            ],
          ),
        ));
  }

  Widget _spacer(double height) {
    return SizedBox(
      height: height,
    );
  }
}
