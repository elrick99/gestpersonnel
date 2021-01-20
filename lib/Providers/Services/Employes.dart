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

  Future<void> getEmploye({String matricule, String password}) async {
    final String url =
        "https://educas-nsa.net/kouassi/testGestPersonel/Employes.php";
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
          // print(_items.length);
          data = employee;
        }).toList();

        notifyListeners();
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

  Employe wheremail(String telephone, String password) {
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

  List<Employe> get items => [..._items];
}
