import 'package:flutter/material.dart';
import 'package:getx_api_app/screens/loader_screen.dart';
import 'package:getx_api_app/screens/maps/map_screen.dart';
import 'package:getx_api_app/screens/multimodal/multimodal_screen.dart';
import 'package:getx_api_app/screens/themes/theme_main_screen.dart';
import 'package:getx_api_app/screens/tts/audio_screen.dart';
import 'package:getx_api_app/screens/tts/simple_tts_screen.dart';
import 'package:getx_api_app/screens/video/video_screen.dart';
import 'package:getx_api_app/screens/video/youtube_screen.dart';
import 'package:getx_api_app/widgets/text_widget.dart';
import 'package:rive/rive.dart';

class StartupScreen extends StatelessWidget {
  StartupScreen({Key? key}) : super(key: key);

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
              _spacer(16),
              //_weiter(context, "tts", TtsScreen()),
              _weiter(context, "tts2", SimpleTtsScreen()),
              _spacer(16),
              _weiter(context, "audio", AudioScreen()),
              _spacer(16),
              _weiter(context, "video", VideoScreen()),
              _spacer(16),
              _weiter(context, "video2", YoutubeAppDemo()),
              _spacer(16),
              _weiter(context, "multimodal", MultimodalScreen()),
              _spacer(16),
              _weiter(context, "map", MapScreen()),
              _spacer(16),
              _weiter(context, "themes", ThemeMainScreen()),
              _spacer(16),
              //_space100(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _spacer(double height) {
    return SizedBox(
      height: height,
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
