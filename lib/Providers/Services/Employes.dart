import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:gestpersonnel/Providers/Models/DB_provider.dart';
import 'package:gestpersonnel/Providers/Models/Employe.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Employes with ChangeNotifier {
  List<Employe> _items = [];

  /**
   * GET Produit
   */

  Future<bool> getEmploye(String matricule, String password) async {
    final String url =
        "https://educas-nsa.net/kouassi/testGestPersonel/Employes.php?matricule=$matricule&mp=$password";
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
          _items.add(Employe.fromJson(employee));
          data = employee;
        }).toList();

        // notifyListeners();
        if (_items.length != 0) {
          print('////////// Existe /////////');
          print(data);
          DBProvider.db.createParent(Employe.fromJson(data));
          return true;
        } else {
          print('////////// Existe pas /////////');
          print(_items.length);
          return false;
        }
      }
    } catch (e) {
      print(e);
    }
  }

  Employe findById(String telephone) {
    // print(pseudo);
    return _items.firstWhere((prod) => prod.matricule == telephone,
        orElse: () => null);
  }

  bool wheremail(String telephone, String password) {
    var element = _items
        .where((element) =>
            element.matricule == telephone && element.password == password)
        .toList()
        .isEmpty;
    return element;
    // print(element);
    // return _item.firstWhere((boutique) => boutique.user.nom == email);
  }

  List<Employe> get items => [..._items];
}
