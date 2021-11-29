import 'package:flutter/material.dart';
import 'package:getx_api_app/screens/loader_screen.dart';
import 'package:getx_api_app/screens/maps/map_screen.dart';
import 'package:getx_api_app/screens/multimodal/multimodal_screen.dart';
import 'package:getx_api_app/screens/tts/audio_screen.dart';
import 'package:getx_api_app/screens/tts/simple_tts_screen.dart';
import 'package:getx_api_app/screens/video/video_screen.dart';
import 'package:getx_api_app/screens/video/youtube_screen.dart';
import 'package:getx_api_app/widgets/text_widget.dart';
import 'package:rive/rive.dart';

class StartupScreen extends StatelessWidget {
  const StartupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("StartupScreen"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //_space100(),
              Container(
                color: Colors.lime,
                //height: MediaQuery.of(context).size.height,
                height: 300,
                child: Center(
                  child:
                      /*
                RiveAnimation.network(
                  'https://cdn.rive.app/animations/vehicles.riv',
                ),
                 */
                      RiveAnimation.asset(
                    'assets/textanimation.riv',
                  ),
                ),
              ),
              Center(
                child: TextWidget(
                    "Der StartScreen stellt den Einstieg in die App dar."
                    " Hier kann eine Anfangsanimation laufen oder ein"
                    " Bild gezeigt werden."
                    " Gleichzeitig können die Modelle initialisiert werden."),
              ),
              _weiter(context, "weiter", LoaderScreen()),
              //_weiter(context, "tts", TtsScreen()),
              _weiter(context, "tts2", SimpleTtsScreen()),
              _weiter(context, "audio", AudioScreen()),
              _weiter(context, "video", VideoScreen()),
              _weiter(context, "video2", YoutubeAppDemo()),
              _weiter(context, "multimodal", MultimodalScreen()),
              _weiter(context, "map", MapScreen()),
              //_space100(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _space100() {
    return SizedBox(
      height: 100,
    );
  }

  Widget _weiter(BuildContext context, String text, Widget target) {
    return Container(
      child: ElevatedButton(
        child: Text(text),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => target));
        },
      ),
    );
  }
}
