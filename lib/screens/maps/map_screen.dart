import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:getx_api_app/model/nominatim.dart';
import 'package:getx_api_app/services/remote_services.dart';
import 'package:getx_api_app/widgets/text_widget.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatefulWidget {
  MapScreen({Key? key}) : super(key: key) {}

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();
  late final _flutterMap;
  late final _mapController;
  late TextFormField _field;

  LatLng antoniusheim = new LatLng(50.5553535, 9.6581591);
  late double lat = antoniusheim.latitude;
  late double lng = antoniusheim.longitude;

  double zoom = 17;

  @override
  void initState() {
    _mapController = MapController();
    _flutterMap = _buildFlutterMap();
    lat = antoniusheim.latitude;
    lng = antoniusheim.longitude;

    _controller.text = "Antoniusheim Cafe";
    _field = TextFormField(
      controller: _controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Gib eine Adresse ein';
        }
        return null;
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
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
                  child: _flutterMap,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      zoom = zoom + 0.1;
                      zoom = min(18, zoom);
                      _mapController.move(LatLng(lat, lng), zoom);
                    },
                    child: Text("+"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      zoom = zoom - 0.1;
                      zoom = max(1, zoom);
                      _mapController.move(LatLng(lat, lng), zoom);
                    },
                    child: Text("-"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      zoom = 17;
                      lat = antoniusheim.latitude;
                      lng = antoniusheim.longitude;
                      _mapController.move(LatLng(lat, lng), zoom);
                    },
                    child: Icon(Icons.home),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFlutterMap() {
    return new FlutterMap(
      mapController: _mapController,
      options: new MapOptions(
        center: antoniusheim,
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
              point: antoniusheim,
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
            _field,
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Center(
                child: ElevatedButton(
                  onPressed: () async {
                    String search = _controller.text;
                    if (_formKey.currentState!.validate()) {
                      List<Nominatim> liste =
                          await RemoteServices.fetchCoordinates(search);
                      if (!liste.isEmpty) {
                        print(liste[0].lat);
                        print(liste[0].lon);

                        lat = double.tryParse(liste[0].lat!) ??
                            antoniusheim.latitude;
                        lng = double.tryParse(liste[0].lon!) ??
                            antoniusheim.longitude;

                        _mapController.move(LatLng(lat, lng), zoom);
                      }

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("${search}")),
                      );
                      FocusScope.of(context).unfocus();
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
