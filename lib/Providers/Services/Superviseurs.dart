import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:gestpersonnel/Providers/Models/DB_provider.dart';
import 'package:gestpersonnel/Providers/Models/Employe.dart';
import 'package:gestpersonnel/Providers/Models/Superviseur.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Superviseurs with ChangeNotifier {
  List<Superviseur> _items = [];

  /**
   * GET Produit
   */

  Future<void> getSuperviseur({String matricule, String password}) async {
    final String url = "https://api-vonabri.herokuapp.com/api/superviseur";
    try {
      var data;
      Response response = await Dio().get(url);
      if (response.statusCode == 200) {
        _items = [];
        // print('////////// Insérer dans le provider /////////');
        // if (response.data['status'] == 0) {
        //   return false;
        // }
        (response.data as List).map((employee) {
          // print(response.data);
          _items.add(Superviseur.fromJson(employee));
          print(_items.length);
          data = employee;
        }).toList();

        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }

  Future<bool> postSuperviseur({String matricule, String password}) async {
    final String url = "https://api-vonabri.herokuapp.com/api/auths/$matricule";
    try {
      var data;
      Response response =
          await Dio().post(url, data: <String, String>{"matricule": matricule});
      if (response.statusCode == 200) {
        _items = [];
        print('////////// Insérer dans le provider /////////');
        if (response.data == "404") {
          return false;
        } else {
          print((Superviseur.fromJson(response.data)));
          DBProvider.db.createSuperviseur(Superviseur.fromJson(response.data));
          // (response.data as List).map((employee) {
          //   print(employee['matricule']);
          //   _items.add(Superviseur.fromJson(employee));
          //   //
          //   // print(_items.length);
          //   data = employee;
          // }).toList();
          return true;
        }
        // notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }

  Superviseur findById(String telephone) {
    // print(pseudo);
    return _items.firstWhere((prod) => prod.matricule == telephone,
        orElse: () => null);
  }

  Superviseur wheremail(String telephone, String password) {
    // print(telephone);
    var data = _items.firstWhere(
        (element) =>
            element.matricule == telephone && element.password == password,
        orElse: () => null);
    // print(data);
    return data;
    // if (data == null) {
    //   return false;
    // } else {
    //   return true;
    // }

    // var element = _items
    //     .where((element) =>
    //         element.matricule == telephone && element.password == password)
    //     .toList()
    //     .isEmpty;
    // return element;
    // print(element);
    // return _item.firstWhere((boutique) => boutique.user.nom == email);
  }

  List<Superviseur> get items => [..._items];
}
