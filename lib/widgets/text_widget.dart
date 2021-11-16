import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatelessWidget {
  String? text;

  TextWidget(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(text!,
              textAlign: TextAlign.justify,
              style: GoogleFonts.aBeeZee(
                fontSize: 20,
              )),
        ));
  }
}
