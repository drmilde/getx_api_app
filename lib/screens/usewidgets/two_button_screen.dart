import 'package:flutter/material.dart';
import 'package:getx_api_app/screens/themes/theme/theme_constants.dart';
import 'package:getx_api_app/widgets/button_two_widget.dart';

class TwoButtonScreen extends StatelessWidget {
  const TwoButtonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Two Button Widgets"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text("Button 1"),
            ),
            SizedBox(
              height: 16,
            ),
            ButtonTwoWidget("Button 2", () {
              print("Button 2 wurde gedrückt");
            }),
          ],
        ),
      ),
    );
  }
}
