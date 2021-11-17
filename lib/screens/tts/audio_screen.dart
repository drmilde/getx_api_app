import 'package:flutter/material.dart';
import 'package:getx_api_app/widgets/text_widget.dart';
import 'package:just_audio/just_audio.dart';

class AudioScreen extends StatefulWidget {
  AudioScreen({Key? key}) : super(key: key) {}

  @override
  State<AudioScreen> createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  late final AudioPlayer player;
  var duration;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    player = new AudioPlayer();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    player.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(child: TextWidget("Wiedergabe von Audio: alternativ"
                " zum TTS System könnte man einen Audioplayer einsetzen."
                " Dazu muss man natürlich die Texte einsprechen,"
                " was aber zumindestens für die statischen Texte der App"
                " problemlos möglich ist."
                " Anders sieht es mit den Stellenbeschreibungen aus: diese"
                " enthalten natürlich jeweils neue Texte. "
                " Vielleicht ist es möglich, die Texte über das Handy"
                " direkt in der App aufzunehmen. Kein Ahnung.")),
            ElevatedButton(
              onPressed: () {
                play();
              },
              child: Text("play"),
            ),
            ElevatedButton(
              onPressed: () {
                stop();
              },
              child: Text("stop"),
            ),
          ],
        ),
      ),
    );
  }

  void play() async {
    duration = await player.setAsset('assets/erster_versuch.mp3');
    player.play(); // Usually you don't want to wait for playback to finish.

    //var duration = await player.setUrl('https://foo.com/bar.mp3');
    //var duration = await player.setFilePath('/path/to/file.mp3');
    //await player.seek(Duration(seconds: 10));
    //await player.pause();
  }

  void stop() {
    player.stop(); // Usually you don't want to wait for playback to finish.

    //var duration = await player.setUrl('https://foo.com/bar.mp3');
    //var duration = await player.setFilePath('/path/to/file.mp3');
    //await player.seek(Duration(seconds: 10));
    //await player.pause();
  }
}
