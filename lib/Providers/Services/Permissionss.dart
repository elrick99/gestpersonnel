import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gestpersonnel/Providers/Models/DB_provider.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:gestpersonnel/Providers/Models/Permission.dart';

class Permissionss with ChangeNotifier {
  List<Permission> _items = [];
  /**
   * GET Produit
   */

  Future<void> getPermission({String idEmploye}) async {
    final String url =
        "https://educas-nsa.net/kouassi/testGestPersonel/Demandes.php?id=$idEmploye";
    try {
      Response response = await Dio().get(url);
      if (response.statusCode == 200) {
        int i = 0;
        _items = [];
        (response.data as List).map((employee) {
          DBProvider.db.createPermission(Permission.fromJson(employee));
        }).toList();
        // notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }

  Future<bool> postPermissions(
      {String codeEmploye,
      String dateD,
      String dateF,
      String motif,
      String desciption}) async {
    final String url =
        "https://educas-nsa.net/kouassi/testGestPersonel/Demandes.php";

    try {
      /**
       * Envoie de donnée
       */
      var response = await http.post(
        url,
        body: <String, String>{
          "idEMpl": codeEmploye,
          "dateD": dateD,
          "dateF": dateF,
          "descrp": desciption,
          "motif": motif,
          "DateTime": "${DateTime.now()}"
        },
      );

      var datas = response.body;
      print("///////////////////// INSERT PERMISSIONS /////////////////////");
      print(datas);
      print(datas[10]);
      if (datas[10] == '0') {
        return false;
      } else {
        return true;
      }
    } catch (e) {
      print(e);
    }
  }

  /**
   * UPDATE
   */

  // void showFavoritesOnly() {
  //   _showFavotitesOnly = true;
  //   notifyListeners();
  // }

  // void showAll() {
  //   _showFavotitesOnly = false;
  //   notifyListeners();
  // }

  void addToken() {
    // _items.add(value);
    notifyListeners();
  }
}
