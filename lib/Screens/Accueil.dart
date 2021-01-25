import 'package:flutter/material.dart';
import 'package:gestpersonnel/Screens/Admin/Connexion.dart';
import 'package:gestpersonnel/Screens/Client/Connexion.dart';

class Accueil extends StatefulWidget {
  @override
  _AccueilState createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MaterialButton(
                    color: Colors.green[400],
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Connexion()));
                    },
                    child: Container(
                        height: MediaQuery.of(context).size.height / 12,
                        width: 100,
                        decoration: BoxDecoration(),
                        child: Center(
                            child: Text('Employe',
                                style: TextStyle(color: Colors.white)))),
                  ),
                  MaterialButton(
                    color: Colors.green[400],
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ConnexionSuperviseur()));
                    },
                    child: Container(
                        height: MediaQuery.of(context).size.height / 12,
                        width: 100,
                        decoration: BoxDecoration(),
                        child: Center(
                            child: Text('Superviseur',
                                style: TextStyle(color: Colors.white)))),
                  ),
                ],
              ),
            ),
            Divider(
              height: 50,
              endIndent: 8.0,
              indent: 8.0,
            ),
            Container(
              child: Text('Contactez-nous'),
            )
          ],
        ),
      ),
    );
  }
}
