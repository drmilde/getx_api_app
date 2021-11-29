// To parse this JSON data, do
//
//     final profil = profilFromJson(jsonString);

import 'dart:convert';

List<Profil> profilFromJson(String str) =>
    List<Profil>.from(json.decode(str).map((x) => Profil.fromJson(x)));

String profilToJson(List<Profil> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Profil {
  Profil({
    this.name,
    this.vorname,
    this.login,
    this.password,
    this.adresse,
    this.kontakt,
    this.zugriff,
  });

  String? name;
  String? vorname;
  String? login;
  String? password;
  Adresse? adresse;
  Kontakt? kontakt;
  Zugriff? zugriff;

  factory Profil.fromJson(Map<String, dynamic> json) =>
      Profil(
        name: json["name"],
        vorname: json["vorname"],
        login: json["login"],
        password: json["password"],
        adresse: Adresse.fromJson(json["adresse"]),
        kontakt: Kontakt.fromJson(json["kontakt"]),
        zugriff: Zugriff.fromJson(json["zugriff"]),
      );

  Map<String, dynamic> toJson() =>
      {
        "name": name,
        "vorname": vorname,
        "login": login,
        "password": password,
        "adresse": adresse!.toJson(),
        "kontakt": kontakt!.toJson(),
        "zugriff": zugriff! .toJson(),
      };
}

class Adresse {
  Adresse({
    this.ort,
    this.strasse,
    this.hausnummer,
  });

  String? ort;
  String? strasse;
  String? hausnummer;

  factory Adresse.fromJson(Map<String, dynamic> json) =>
      Adresse(
        ort: json["ort"],
        strasse: json["strasse"],
        hausnummer: json["hausnummer"],
      );

  Map<String, dynamic> toJson() =>
      {
        "ort": ort,
        "strasse": strasse,
        "hausnummer": hausnummer,
      };
}

class Kontakt {
  Kontakt({
    this.email,
    this.tel,
    this.web,
  });

  String? email;
  String? tel;
  String? web;

  factory Kontakt.fromJson(Map<String, dynamic> json) =>
      Kontakt(
        email: json["email"],
        tel: json["tel"],
        web: json["web"],
      );

  Map<String, dynamic> toJson() =>
      {
        "email": email,
        "tel": tel,
        "web": web,
      };
}

class Zugriff {
  Zugriff({
    this.datum,
  });

  DateTime? datum;

  factory Zugriff.fromJson(Map<String, dynamic> json) =>
      Zugriff(
        datum: DateTime.parse(json["datum"]),
      );

  Map<String, dynamic> toJson() =>
      {
        "datum":
        "${datum!.year.toString().padLeft(4, '0')}-${datum!.month.toString()
            .padLeft(2, '0')}-${datum!.day.toString().padLeft(2, '0')}",
      };
}
