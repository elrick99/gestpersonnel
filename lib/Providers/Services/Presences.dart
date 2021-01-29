import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gestpersonnel/Providers/Models/DB_provider.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:gestpersonnel/Providers/Models/Permission.dart';

class Presences with ChangeNotifier {
  /**
   * GET Produit
   */

  Future<bool> postAbsences({
    int codeEmploye,
    String dateAbsence,
    int idMotif,
  }) async {
    final String url = "https://api-vonabri.herokuapp.com/api/absence";

    try {
      /**
       * Envoie de donnée
       */
      var data = <String, dynamic>{
        "idMotif": idMotif,
        "idEmploye": codeEmploye,
        "dateAbsence": DateTime.now().toString().split('.')[0]
      };
      print(json.encode(data));
      var response = await http.post(
        Uri.encodeFull(url),
        headers: {
          "content-type": "application/json",
        },
        body: json.encode(data),
      );

      var datas = response.body;
      print("///////////////////// INSERT ABSENCE /////////////////////");
      // print(datas);
      // print(datas.length);
      if (response.statusCode == 200 || datas.length == 202) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<bool> postArrive({
    int codeEmploye,
    String dateAbsence,
    int idMotif,
  }) async {
    final String url = "https://api-vonabri.herokuapp.com/api/arriveDepart";

    try {
      /**
       * Envoie de donnée
       */
      var data = <String, dynamic>{
        "idEmploye": idMotif,
        "dateArrive": DateTime.now().toString().split('.')[0],
        "dateDepart": DateTime.now().toString().split('.')[0]
      };
      print(json.encode(data));
      var response = await http.post(
        Uri.encodeFull(url),
        headers: {
          "content-type": "application/json",
        },
        body: json.encode(data),
      );

      var datas = response.body;
      print("///////////////////// INSERT ABSENCE /////////////////////");
      print(datas);
      // print(datas.length);
      if (response.statusCode == 200 || datas.length == 202) {
        return true;
      } else {
        return false;
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
