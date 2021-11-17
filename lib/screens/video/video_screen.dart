import 'package:flutter/material.dart';
import 'package:getx_api_app/widgets/text_widget.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoScreen extends StatelessWidget {
  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: '99DfoGjfU6Y',
    flags: YoutubePlayerFlags(
      autoPlay: false,
      mute: true,
      controlsVisibleAtStart: false,
      hideControls: false,
    ),
  );

  VideoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(),
            TextWidget("Youtube ist eine gute Basis für die Verteilung von"
                " Informationsvideos. Über den YoutubePlayer können die Videos"
                " einfach in der App angezeigt werden. "),
            YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              onReady: () {
                //_controller.addListener(listener);
              },
            ),
          ],
        ),
      ),
    );
  }
}
