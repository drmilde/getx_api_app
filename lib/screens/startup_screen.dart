import 'package:flutter/material.dart';
import 'package:getx_api_app/screens/loader_screen.dart';
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
      body: Center(
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
            _weiter(context),
            //_space100(),
          ],
        ),
      ),
    );
  }

  Widget _space100() {
    return SizedBox(
      height: 100,
    );
  }

  Widget _weiter(BuildContext context) {
    return Container(
      child: ElevatedButton(
        child: Text("weiter"),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => LoaderScreen()));
        },
      ),
    );
  }
}
