import 'package:flutter/material.dart';
import 'package:getx_api_app/screens/themes/theme/theme_constants.dart';

class ButtonTwoWidget extends StatelessWidget {
  String text;
  VoidCallback? callback;

  ButtonTwoWidget(this.text, this.callback, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callback,
      child: Text(text),
      style: lightTheme.elevatedButtonTheme.style!.copyWith(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
        fixedSize: MaterialStateProperty.all<Size?>(Size(170, 48)),
      ),
    );
  }
}
