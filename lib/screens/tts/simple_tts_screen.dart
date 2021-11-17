import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:getx_api_app/widgets/text_widget.dart';

class SimpleTtsScreen extends StatelessWidget {
  final FlutterTts tts = new FlutterTts();

  SimpleTtsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TextWidget("Die Sprachsynthese funktioniert einigermaßen gut."
                " Allerdings ist die Ausgabe abhängig vom Gerät."
                " Für die Ausgabe von deutschen Texten muss Gerät"
                " in den Spracheinstellungen auf 'Deutsch' umgestellt sein."
                " Wenn hier keine (deutsche) Sprache ausgegeben wird,"
                " dann scheint dies nicht er Fall zu sein."
                " Ich denke, dies hat mit dem Emulator zu tun. Man muss"
                " also die Sprachusgabe direkt auf einem Gerät testen."),
            Center(
              child: Container(
                  child: ElevatedButton(
                onPressed: () {
                  speakDe();
                },
                child: Text("sprich"),
              )),
            ),
            Center(
              child: Container(
                  child: ElevatedButton(
                    onPressed: () {
                      speakEn();
                    },
                    child: Text("say something"),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  void speakDe() async {
    await tts.setLanguage("de-DE");
    await tts.speak("Hallo, hier sollte ein Text in Deutsch rauskommen");
  }
  void speakEn() async {
    await tts.setLanguage("en-US");
    await tts.speak("Hello, this is the default english voice. ");
  }
}
