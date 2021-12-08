import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class MultimodalWidget extends StatelessWidget {
  final FlutterTts tts = new FlutterTts();

  Widget content;
  int type = 0;
  String textToSpeak;
  String textToDisplay;

  MultimodalWidget(
      {required this.content,
      this.type = 0,
      this.textToSpeak = "Textausgabe",
      this.textToDisplay = "Textanzeige",
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case 0:
        return content;
      case 1:
        return Stack(
          children: [
            content,
            Positioned(
              right: 0,
              bottom: 0,
              child: IconButton(
                onPressed: () {
                  speakDe(textToSpeak);
                  //speakEn(textToSpeak);
                },
                icon: Icon(Icons.play_arrow_outlined),
                color: Colors.green,
                iconSize: 64,
              ),
            ),
            Positioned(
              left: 16,
              bottom: 32,
              child: Text(textToDisplay,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  )),
            )
          ],
        );
      case 2:
        return Stack(
          children: [
            Container(
              height: 100,
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: IconButton(
                onPressed: () {
                  speakDe(textToSpeak);
                  //speakEn(textToSpeak);
                },
                icon: Icon(Icons.play_arrow_outlined),
                color: Colors.green,
                iconSize: 64,
              ),
            ),
            Positioned(
              left: 16,
              bottom: 32,
              child: Text(textToDisplay,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  )),
            )
          ],
        );
        ;
      default:
        return content;
    }
    return Container();
  }

  void speakDe(String text) async {
    await tts.setLanguage("de-DE");
    //await tts.speak("Hallo, hier sollte ein Text in Deutsch rauskommen");
    await tts.speak(text);
  }

  void speakEn(String text) async {
    await tts.setLanguage("en-US");
    //await tts.speak("Hello, this is the default english voice. ");
    await tts.speak(text);
  }
}
