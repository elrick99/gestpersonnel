import 'package:flutter/material.dart';
import 'package:gestpersonnel/Providers/Services/Employes.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gestpersonnel/Providers/Models/DB_provider.dart';

class Connexion extends StatefulWidget {
  @override
  _ConnexionState createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {
  getPrefIdUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      checkPseudo = sharedPreferences.getString('my_Matricule');
    });
  }

  String checkPseudo;
  bool info = false;
  bool vidibility = true;
  bool loaded = false;
  bool result = false;
  final formKey = new GlobalKey<FormState>();
  bool validateSaved() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    getPrefIdUser();
  }

  String _myMatricule;
  String _myPassword;
  @override
  Widget build(BuildContext context) {
    final providerEmploye = Provider.of<Employes>(context);
    DBProvider.db.getAllEmploye();
    // providerEmploye.geParents();
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(DBProvider.db.itemEmploye?.length.toString()),
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Container(
                  height: MediaQuery.of(context).size.height / 3,
                  width: MediaQuery.of(context).size.width,
                  // decoration: BoxDecoration(color: Colors.blue),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height / 12,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.green[400])),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: TextFormField(
                              keyboardType: TextInputType.phone,
                              validator: (value) {
                                return value.isEmpty
                                    ? 'Matricule required'
                                    : null;
                              },
                              onSaved: (newValue) {
                                _myMatricule = newValue;
                              },
                              autocorrect: true,
                              decoration: InputDecoration(
                                hintText: 'Matricule',
                                errorBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                border: UnderlineInputBorder(),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height / 12,
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: TextFormField(
                              validator: (value) {
                                return value.isEmpty
                                    ? 'Matricule required'
                                    : null;
                              },
                              onSaved: (newValue) {
                                _myPassword = newValue;
                              },
                              autocorrect: true,
                              decoration: InputDecoration(
                                hintText: 'Mot de Passe',
                                errorBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                border: UnderlineInputBorder(),
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.green[400])),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 50,
                          width: 200,
                          decoration: BoxDecoration(
                              color: Colors.green[400],
                              borderRadius: BorderRadius.circular(20)),
                          child: Builder(
                            builder: (context) => MaterialButton(
                                child: Text(
                                  'Connexion',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "TheStudentsTeacher-Regular",
                                    fontSize: 20,
                                  ),
                                ),
                                onPressed: () {
                                  DBProvider.db.getAllEmploye();
                                  DBProvider.db.deleteAllEmploye();
                                  if (validateSaved()) {
                                    var parent = providerEmploye
                                        .getEmploye(_myMatricule, _myPassword)
                                        .then((value) async {
                                      if (value == true) {
                                        final prefs = await SharedPreferences
                                            .getInstance();
                                        var pseudo = prefs.setString(
                                            'my_Matricule', '$_myMatricule');
                                        setState(() {
                                          loaded = true;
                                          result = true;
                                        });
                                        // Navigator.of(context)
                                        //     .pushNamedAndRemoveUntil(
                                        //   'bottomBar',
                                        //   (Route<dynamic> route) => false,
                                        // );
                                      } else {
                                        setState(() {
                                          info = true;
                                        });
                                      }
                                    });
                                    // final verified = providerEmploye.wheremail(
                                    //     _myMatricule, _myPassword);
                                    // // print(verified);
                                    // if (verified == true) {
                                    //   setState(() {
                                    //     info = false;
                                    //   });
                                    // } else {

                                    //   // var insert =
                                    //   //     DBProvider.db.createParent(parent);
                                    //   // insert.then((value) async {
                                    //   //   if (value == 1) {
                                    //   //     setState(() {
                                    //   //       loaded = true;
                                    //   //       result = true;
                                    //   //     });
                                    //   //     providerToken.posTokens(
                                    //   //         _myTelephone, _token);
                                    //   //     var eleves = providerEleve.getEleves(
                                    //   //         codeparent: code);
                                    //   //     var matieres =
                                    //   //         providerMatiere.getMatieres();
                                    //   //     await Future.delayed(
                                    //   //         const Duration(seconds: 3));
                                    //   //     var codes = prefs.setString(
                                    //   //         'my_CodeUser',
                                    //   //         '${parent.codeUtilisateur}');
                                    //   //     _myTelephone = null;
                                    //   //     Navigator.of(context)
                                    //   //         .pushNamedAndRemoveUntil(
                                    //   //             'listEleve',
                                    //   //             (Route<dynamic> route) => false,
                                    //   //             arguments: parent);
                                    //   //   }
                                    //   // });
                                    // }
                                  }
                                }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              (info == true)
                  ? Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 28.0),
                      child: Text('Matricule ou Password Incorrect',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold)),
                    )
                  : Text(''),
              Divider(
                color: Colors.grey,
                height: 10,
                endIndent: 50,
                indent: 50,
              ),
              MaterialButton(
                child: Text('Contactez-Nous',
                    style: TextStyle(
                        fontFamily: "Space kids",
                        fontSize: 16,
                        fontStyle: FontStyle.italic)),
                onPressed: () {
                  // launch("tel:+225 21018611");
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
