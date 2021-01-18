// To parse this JSON data, do
//
//     final permission = permissionFromJson(jsonString);

import 'dart:convert';

List<Permission> permissionFromJson(String str) =>
    List<Permission>.from(json.decode(str).map((x) => Permission.fromJson(x)));

String permissionToJson(List<Permission> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Permission {
  Permission({
    this.datePermission,
    this.dateAutorisation,
    this.idMotif,
    this.description,
    this.idEmploye,
    this.createdAt,
    this.updatedAt,
  });

  String datePermission;
  String dateAutorisation;
  String idMotif;
  dynamic description;
  String idEmploye;
  dynamic createdAt;
  dynamic updatedAt;

  factory Permission.fromJson(Map<String, dynamic> json) => Permission(
        datePermission: json["datePermission"],
        dateAutorisation: json["dateAutorisation"],
        idMotif: json["idMotif"],
        description: json["description"],
        idEmploye: json["idEmploye"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "datePermission": datePermission,
        "dateAutorisation": dateAutorisation,
        "idMotif": idMotif,
        "description": description,
        "idEmploye": idEmploye,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
