// To parse this JSON data, do
//
//     final configuration = configurationFromJson(jsonString);

import 'dart:convert';

List<Configuration> configurationFromJson(String str) =>
    List<Configuration>.from(
        json.decode(str).map((x) => Configuration.fromJson(x)));

String configurationToJson(List<Configuration> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Configuration {
  Configuration({
    this.name,
    this.vorname,
    this.geburtsdatum,
    this.kenntnisse,
    this.hobbies,
  });

  String? name;
  String? vorname;
  String? geburtsdatum;
  List<String>? kenntnisse;
  List<String>? hobbies;

  factory Configuration.fromJson(Map<String, dynamic> json) => Configuration(
        name: json["name"],
        vorname: json["vorname"],
        geburtsdatum: json["geburtsdatum"],
        kenntnisse: List<String>.from(json["kenntnisse"].map((x) => x)),
        hobbies: List<String>.from(json["hobbies"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "vorname": vorname,
        "geburtsdatum": geburtsdatum,
        "kenntnisse": List<dynamic>.from(kenntnisse!.map((x) => x)),
        "hobbies": List<dynamic>.from(hobbies!.map((x) => x)),
      };
}
