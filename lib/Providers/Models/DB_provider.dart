import 'dart:io';
import 'package:gestpersonnel/Providers/Models/Employe.dart';
import 'package:gestpersonnel/Providers/Models/Permission.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  List<Employe> _itemEmploye;
  // List<Employe> _itemEmploye = [];
  List<Permission> _itemPermission = [];

  Employe _itemParent;
  static Database _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();
  Future<Database> get database async {
    // If database exists, return database
    if (_database != null) return _database;

    // If database don't exists, create one
    _database = await initDB();

    return _database;
  }

  // Create the database and the Employee table
  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'educapps_manager.db');

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE Employe('
          'id INTEGER PRIMARY KEY,'
          'matricule TEXT,'
          'nom TEXT,'
          'prenoms TEXT,'
          'contact TEXT,'
          'email TEXT,'
          'dateNaissance TEXT,'
          'lieuNaissance TEXT,'
          'domicile TEXT,'
          'sexe TEXT,'
          'nationalite TEXT,'
          'ethnie TEXT,'
          'statut_matrimonial TEXT,'
          'nombre_epouse TEXT,'
          'nombre_enfant_charge TEXT,'
          'croyance TEXT,'
          'dateEmbauche TEXT,'
          'dateFinContrat TEXT,'
          'password TEXT,'
          'idTypeContrat TEXT,'
          'idStatut TEXT,'
          'idService TEXT,'
          'idFonction TEXT,'
          'idSpecialite TEXT,'
          'idSite TEXT,'
          'created_at TEXT,'
          'updated_at TEXT'
          ')');
      await db.execute('CREATE TABLE Permissions('
          'id INTEGER PRIMARY KEY,'
          'datePermission TEXT,'
          'dateAutorisation TEXT,'
          'idMotif TEXT,'
          'description TEXT,'
          'idEmploye TEXT,'
          'created_at TEXT,'
          'updated_at TEXT'
          ')');
    });
  }

  // Insert Parent on database
  Future<int> createParent(Employe newParent) async {
    await deleteAllEmploye();
    final db = await database;
    final res = await db.insert('Employe', newParent.toJson());
    final ress = await db.rawQuery("SELECT * FROM Employe");

    Employe list =
        ress.isNotEmpty ? ress.map((c) => Employe.fromJson(c)).first : null;

    // print("//////////LIST////////");
    // print(list);
    return res;
  }

  Future<int> createPermission(Permission newParent) async {
    await deleteAllPermissions();
    final db = await database;
    final res = await db.insert('Permissions', newParent.toJson());
    final ress = await db.rawQuery("SELECT * FROM Permissions");

    Permission list =
        ress.isNotEmpty ? ress.map((c) => Permission.fromJson(c)).first : null;

    // print("//////////LIST////////");
    // print(list);
    return res;
  }

  // Delete all Parents
  // Future<int> deleteSameMoyenne({String id}) async {
  //   String cond = "17";
  //   final db = await database;
  //   int res;
  //   if (id != null) {
  //     res = await db.rawDelete('DELETE FROM Moyennes WHERE code_mat ="$id"');
  //   } else {
  //     res = await db.rawDelete('DELETE FROM Moyennes');
  //   }

  //   return res;
  // }

  // Delete all Parents
  Future<int> deleteAllEmploye() async {
    final db = await database;
    final res = await db.rawDelete('DELETE FROM Employe');

    return res;
  }

  Future<int> deleteAllPermissions() async {
    final db = await database;
    final res = await db.rawDelete('DELETE FROM Permissions');

    return res;
  }

  // Future<Parent> findbyId(String numero) async {
  //   final db = await database;
  //   final res = await db
  //       .rawQuery("SELECT * FROM Parents WHERE contact_utilisateur = $numero");
  //   Parent parent = res.isNotEmpty ? res.map((c) => Parent.fromJson(c)) : false;

  //   return parent;
  // }

  // Future<List<Moyenne>> getAllMoyenne({String trmdate}) async {
  //   final db = await database;
  //   if (trmdate != null) {
  //     // print(trmdate);
  //     final res = await db
  //         .rawQuery("SELECT * FROM Moyennes WHERE date_debut_trim=='$trmdate'");

  //     List<Moyenne> list =
  //         res.isNotEmpty ? res.map((c) => Moyenne.fromJson(c)).toList() : [];
  //     _itemMoyenne = list;
  //     // print('////////// LISTE Moyenne /////////');
  //     // print(_itemMoyenne.length);
  //     return list;
  //   } else {
  //     final res = await db.rawQuery("SELECT * FROM Moyennes");

  //     List<Moyenne> list =
  //         res.isNotEmpty ? res.map((c) => Moyenne.fromJson(c)).toList() : [];
  //     _itemMoyenne = list;
  //     return list;
  //   }
  // }

  Future<List<Employe>> getAllEmploye() async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM Employe");

    List<Employe> list =
        res.isNotEmpty ? res.map((c) => Employe.fromJson(c)).toList() : null;
    _itemEmploye = list;
    // print('////////// LISTE MESSAGES RECU /////////');
    // print(list);
    return list;
  }

  Future<List<Permission>> getAllPermission() async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM Permissions");

    List<Permission> list =
        res.isNotEmpty ? res.map((c) => Permission.fromJson(c)).toList() : null;
    _itemPermission = list;
    // print('////////// LISTE Permissions RECU /////////');
    // print(list);
    return list;
  }

  List<Employe> get itemEmploye => _itemEmploye;

  List<Permission> get itemPermission => _itemPermission;
  // Moyenne get oneMoyenne => itemMoyenne;
}
