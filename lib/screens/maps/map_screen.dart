import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:getx_api_app/widgets/text_widget.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TextWidget("Über OpenStreetMap können Karten angezeigt werden."
                " Mit Nominatim existiert auch ein API über das"
                " Adressen in LatLong Positionen umgerechnet werden "
                " können."),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _buildForm(context),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 300,
                child: _buildFlutterMap(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFlutterMap() {
    LatLng pos = new LatLng(50.5553535, 9.6581591);
    return new FlutterMap(
      options: new MapOptions(
        center: pos,
        //center: new LatLng(51.5, -0.09),
        zoom: 17.0,
      ),
      layers: [
        new TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c']),
        new MarkerLayerOptions(
          markers: [
            new Marker(
              width: 20.0,
              height: 20.0,
              point: pos,
              builder: (ctx) => new Container(
                child: new FlutterLogo(),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildForm(BuildContext context) {
    return Container(
      width: 250,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              initialValue: "Antoniusheim Cafe",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Gib eine Adresse ein!';
                }
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    }
                  },
                  child: const Text('Suche'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
