import 'package:flutter/material.dart';
import 'package:getx_api_app/screens/loader_screen.dart';
import 'package:getx_api_app/widgets/text_widget.dart';

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
            _space100(),
            Expanded(
                child: Center(
              child: TextWidget(
                  "Der StartScreen stellt den Einstieg in die App dar. "),
            )),
            _weiter(context),
            _space100(),
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
