// To parse this JSON data, do
//
//     final employe = employeFromJson(jsonString);

import 'dart:convert';

List<Employe> employeFromJson(String str) =>
    List<Employe>.from(json.decode(str).map((x) => Employe.fromJson(x)));

String employeToJson(List<Employe> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Employe {
  Employe({
    this.matricule,
    this.nom,
    this.prenoms,
    this.contact,
    this.email,
    this.dateNaissance,
    this.lieuNaissance,
    this.domicile,
    this.sexe,
    this.nationalite,
    this.ethnie,
    this.statutMatrimonial,
    this.nombreEpouse,
    this.nombreEnfantCharge,
    this.croyance,
    this.dateEmbauche,
    this.dateFinContrat,
    this.password,
    this.idTypeContrat,
    this.idStatut,
    this.idService,
    this.idFonction,
    this.idSpecialite,
    this.idSite,
    this.createdAt,
    this.updatedAt,
  });

  String matricule;
  String nom;
  String prenoms;
  String contact;
  String email;
  DateTime dateNaissance;
  String lieuNaissance;
  String domicile;
  String sexe;
  String nationalite;
  String ethnie;
  String statutMatrimonial;
  String nombreEpouse;
  String nombreEnfantCharge;
  String croyance;
  DateTime dateEmbauche;
  DateTime dateFinContrat;
  String password;
  String idTypeContrat;
  String idStatut;
  String idService;
  String idFonction;
  String idSpecialite;
  String idSite;
  dynamic createdAt;
  dynamic updatedAt;

  factory Employe.fromJson(Map<String, dynamic> json) => Employe(
        matricule: json["matricule"],
        nom: json["nom"],
        prenoms: json["prenoms"],
        contact: json["contact"],
        email: json["email"],
        dateNaissance: DateTime.parse(json["dateNaissance"]),
        lieuNaissance: json["lieuNaissance"],
        domicile: json["domicile"],
        sexe: json["sexe"],
        nationalite: json["nationalite"],
        ethnie: json["ethnie"],
        statutMatrimonial: json["statut_matrimonial"],
        nombreEpouse: json["nombre_epouse"],
        nombreEnfantCharge: json["nombre_enfant_charge"],
        croyance: json["croyance"],
        dateEmbauche: DateTime.parse(json["dateEmbauche"]),
        dateFinContrat: DateTime.parse(json["dateFinContrat"]),
        password: json["password"],
        idTypeContrat: json["idTypeContrat"],
        idStatut: json["idStatut"],
        idService: json["idService"],
        idFonction: json["idFonction"],
        idSpecialite: json["idSpecialite"],
        idSite: json["idSite"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "matricule": matricule,
        "nom": nom,
        "prenoms": prenoms,
        "contact": contact,
        "email": email,
        "dateNaissance":
            "${dateNaissance.year.toString().padLeft(4, '0')}-${dateNaissance.month.toString().padLeft(2, '0')}-${dateNaissance.day.toString().padLeft(2, '0')}",
        "lieuNaissance": lieuNaissance,
        "domicile": domicile,
        "sexe": sexe,
        "nationalite": nationalite,
        "ethnie": ethnie,
        "statut_matrimonial": statutMatrimonial,
        "nombre_epouse": nombreEpouse,
        "nombre_enfant_charge": nombreEnfantCharge,
        "croyance": croyance,
        "dateEmbauche":
            "${dateEmbauche.year.toString().padLeft(4, '0')}-${dateEmbauche.month.toString().padLeft(2, '0')}-${dateEmbauche.day.toString().padLeft(2, '0')}",
        "dateFinContrat":
            "${dateFinContrat.year.toString().padLeft(4, '0')}-${dateFinContrat.month.toString().padLeft(2, '0')}-${dateFinContrat.day.toString().padLeft(2, '0')}",
        "password": password,
        "idTypeContrat": idTypeContrat,
        "idStatut": idStatut,
        "idService": idService,
        "idFonction": idFonction,
        "idSpecialite": idSpecialite,
        "idSite": idSite,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
