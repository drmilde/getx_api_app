import 'package:flutter/material.dart';
import 'package:getx_api_app/widgets/multimodal_widget.dart';

class MultimodalScreen extends StatelessWidget {
  const MultimodalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                _buildSizedBox(),
                MultimodalWidget(
                  type: 1,
                  content: Container(
                    child: Image.network(
                        "https://www.antonius.de/files/antonius/bilder/logos/AN_Logos_Spalte-re_B250px.png"),
                    height: 250,
                    width: double.infinity,
                    color: Colors.blue[300],
                  ),
                ),
                _buildSizedBox(),
                MultimodalWidget(
                  type: 2,
                  content: Container(
                    height: 100,
                    width: double.infinity,
                    color: Colors.red,
                  ),
                ),
                _buildSizedBox(),
                MultimodalWidget(
                  type: 0,
                  content: Container(
                    height: 200,
                    width: double.infinity,
                    color: Colors.lime,
                    child: Image.network(
                        "https://www.antonius.de/files/antonius/bilder/logos/AN_Logos_Spalte-re_B250px.png"),
                  ),
                ),
                _buildSizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox _buildSizedBox() {
    return SizedBox(
      height: 16,
    );
  }
}