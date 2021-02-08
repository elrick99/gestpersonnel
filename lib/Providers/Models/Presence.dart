// To parse this JSON data, do
//
//     final presence = presenceFromJson(jsonString);

import 'dart:convert';

List<Presence> presenceFromJson(String str) =>
    List<Presence>.from(json.decode(str).map((x) => Presence.fromJson(x)));

String presenceToJson(List<Presence> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Presence {
  Presence({
    this.matricule,
    this.nom,
    this.prenoms,
    this.libMotif,
  });

  String matricule;
  String nom;
  String prenoms;
  String libMotif;

  factory Presence.fromJson(Map<String, dynamic> json) => Presence(
        matricule: json["matricule"],
        nom: json["nom"],
        prenoms: json["prenoms"],
        libMotif: json["libMotif"] == null ? null : json["libMotif"],
      );

  Map<String, dynamic> toJson() => {
        "matricule": matricule,
        "nom": nom,
        "prenoms": prenoms,
        "libMotif": libMotif == null ? null : libMotif,
      };
}
