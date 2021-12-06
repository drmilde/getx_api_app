import 'package:flutter/material.dart';
import 'package:getx_api_app/screens/themes/theme/theme_manager.dart';

class SwitchThemeScreen extends StatefulWidget {
  ThemeManager _themeManager;
  SwitchThemeScreen(this._themeManager, {Key? key}) : super(key: key);

  @override
  _SwitchThemeScreenState createState() => _SwitchThemeScreenState();
}

class _SwitchThemeScreenState extends State<SwitchThemeScreen> {
  bool v = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Switch Theme"),
        actions: [
          Switch(value: v, onChanged: (newValue) {
            widget._themeManager.toggleTheme(newValue);
            setState(() {
              print (newValue);
              v = newValue;
            });
          }),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Image.network(
                  "https://iwetec.de/wp-content/uploads/2013/03/logo-antonius.png"),
              height: 60,
            ),
            _addSpace(16),
            Text("Antoniusheim Fulda"),
            _addSpace(16),
            Text("Ihr Partner in Fulda"),
            _addSpace(16),
            Text("Eine einfach Meldung"),
            _addSpace(16),
            TextField(),
            _addSpace(16),
            ElevatedButton(
              onPressed: () {},
              child: Text("Hier clicken"),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _addSpace(double height) {
    return SizedBox(
      height: height,
    );
  }
}
