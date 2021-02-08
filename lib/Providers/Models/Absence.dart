// To parse this JSON data, do
//
//     final absence = absenceFromJson(jsonString);

import 'dart:convert';

List<Absence> absenceFromJson(String str) =>
    List<Absence>.from(json.decode(str).map((x) => Absence.fromJson(x)));

String absenceToJson(List<Absence> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Absence {
  Absence({
    this.matricule,
    this.nom,
    this.prenoms,
    this.libMotif,
  });

  String matricule;
  String nom;
  String prenoms;
  String libMotif;

  factory Absence.fromJson(Map<String, dynamic> json) => Absence(
        matricule: json["matricule"],
        nom: json["nom"],
        prenoms: json["prenoms"],
        libMotif: json["libMotif"],
      );

  Map<String, dynamic> toJson() => {
        "matricule": matricule,
        "nom": nom,
        "prenoms": prenoms,
        "libMotif": libMotif,
      };
}
