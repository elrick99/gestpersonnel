// To parse this JSON data, do
//
//     final employe = employeFromJson(jsonString);

import 'dart:convert';

List<EmployeDB> employeFromJson(String str) =>
    List<EmployeDB>.from(json.decode(str).map((x) => EmployeDB.fromJson(x)));

String employeToJson(List<EmployeDB> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EmployeDB {
  EmployeDB({
    this.id,
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
    this.idFonction,
    this.idSpecialite,
    this.idService,
    this.idSuperviseur,
    this.idSite,
    this.createdAt,
    this.updatedAt,
    this.nomSup,
    this.prenomSup,
    this.contactSup,
    this.libStatut,
    this.libSite,
    this.libTypeContrat,
    this.libService,
    this.libFonction,
    this.libSpecialite,
  });

  String id;
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
  String idFonction;
  String idSpecialite;
  String idService;
  String idSuperviseur;
  String idSite;
  DateTime createdAt;
  DateTime updatedAt;
  String nomSup;
  String prenomSup;
  String contactSup;
  String libStatut;
  String libSite;
  String libTypeContrat;
  String libService;
  String libFonction;
  String libSpecialite;

  factory EmployeDB.fromJson(Map<String, dynamic> json) => EmployeDB(
        id: json["id"],
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
        idFonction: json["idFonction"],
        idSpecialite: json["idSpecialite"],
        idService: json["idService"],
        idSuperviseur: json["idSuperviseur"],
        idSite: json["idSite"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        nomSup: json["nomSup"],
        prenomSup: json["prenomSup"],
        contactSup: json["contactSup"],
        libStatut: json["libStatut"],
        libSite: json["libSite"],
        libTypeContrat: json["libTypeContrat"],
        libService: json["libService"],
        libFonction: json["libFonction"],
        libSpecialite: json["libSpecialite"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
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
        "idFonction": idFonction,
        "idSpecialite": idSpecialite,
        "idService": idService,
        "idSuperviseur": idSuperviseur,
        "idSite": idSite,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "nomSup": nomSup,
        "prenomSup": prenomSup,
        "contactSup": contactSup,
        "libStatut": libStatut,
        "libSite": libSite,
        "libTypeContrat": libTypeContrat,
        "libService": libService,
        "libFonction": libFonction,
        "libSpecialite": libSpecialite,
      };
}
