import 'package:flutter/material.dart';
import 'package:getx_api_app/widgets/button_two_widget.dart';
import 'package:getx_api_app/widgets/spacer_widget.dart';
import 'package:getx_api_app/widgets/text_widget.dart';

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
            TextWidget(
                "Hier wird gezeigt, wie man Variationen eines Widgets erzeugen"
                " und nutzen kann. "
                " Button 1 ist der ElevatedButton im Standardtheme."
                " Button 2 kopiert den Style des Standardthemes und"
                " verändert Größe und Farbe (ButtonTwoWidget)."
                " Dem Widget wird ein Text und eine Callbackfunktion"
                " übergeben."),
            SpacerWidget(24),
            Expanded(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Button 1"),
                  ),
                  SpacerWidget(16),
                  ButtonTwoWidget("Button 2", () {
                    print("Button 2 wurde gedrückt");
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
