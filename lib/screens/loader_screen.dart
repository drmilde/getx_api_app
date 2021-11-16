import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:getx_api_app/model/configuration.dart';
import 'package:getx_api_app/services/remote_services.dart';

class LoaderScreen extends StatefulWidget {
  @override
  _LoaderScreenState createState() => _LoaderScreenState();
}

class _LoaderScreenState extends State<LoaderScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Load Configuration"),
        ),
        body: FutureBuilder<List<Configuration>>(
          future: RemoteServices.fetchConfigurationFromAssets(),
          // a previously-obtained Future<String> or null
          builder: (BuildContext context,
              AsyncSnapshot<List<Configuration>> snapshot) {
            if (snapshot.hasData) {
              return _buildInhalt(snapshot.data);
            } else if (snapshot.hasError) {
              // behandele Fehler
            } else {}
            return Container(); // hier kann ein ProgressIndicator eingefügt werden
          },
        ));
  }

  Widget _buildInhalt(List<Configuration>? configuration) {
    return Column(
      children: [
        Container(
          child: Text("Die geladene Konfiguration"),
        ),
        Expanded(
          child: Container(
            child: ListView.builder(
              itemCount: configuration!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 200,
                    color: Colors.green,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(configuration[index].name!),
                        Text(configuration[index].vorname!),
                        Text(configuration[index].geburtsdatum!),
                        Text(configuration[index].hobbies!.toString()),
                        Text(configuration[index].kenntnisse!.toString())
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
