import 'package:flutter/material.dart';

class SpacerWidget extends StatelessWidget {
  double height;

  SpacerWidget(this.height, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height,
    );
  }
}
