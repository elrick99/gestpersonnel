import 'package:flutter/material.dart';
import 'package:gestpersonnel/Providers/Models/DB_provider.dart';
import 'package:gestpersonnel/Providers/Services/Employes.dart';
import 'package:gestpersonnel/Providers/Services/Superviseurs.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gestpersonnel/Providers/Models/DB_provider.dart';

class ConnexionSuperviseur extends StatefulWidget {
  @override
  _ConnexionSuperviseurState createState() => _ConnexionSuperviseurState();
}

class _ConnexionSuperviseurState extends State<ConnexionSuperviseur> {
  getPrefIdUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      checkPseudo = sharedPreferences.getString('my_Matricule');
    });
  }

  bool password = true;
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
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    final providerEmploye = Provider.of<Superviseurs>(context);
    providerEmploye.getSuperviseur();
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
    final providerEmploye = Provider.of<Superviseurs>(context);
    DBProvider.db.getAllSuperviseur();
    // providerEmploye.geParents();

    return (loaded == true)
        ? Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  CircularProgressIndicator(
                    backgroundColor: Colors.white,
                    valueColor:
                        new AlwaysStoppedAnimation<Color>(Colors.green[400]),
                    strokeWidth: 3,
                  )
                ],
              ),
            ),
          )
        : Scaffold(
            body: Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(providerEmploye.items.length.toString()),
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
                                    border:
                                        Border.all(color: Colors.green[400])),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 8.0),
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
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
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 8.0),
                                  child: TextFormField(
                                    obscureText:
                                        (password == true) ? true : false,
                                    validator: (value) {
                                      return value.isEmpty
                                          ? 'Password required'
                                          : null;
                                    },
                                    onSaved: (newValue) {
                                      _myPassword = newValue;
                                    },
                                    autocorrect: true,
                                    decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          if (password == true) {
                                            setState(() {
                                              password = false;
                                            });
                                          } else {
                                            setState(() {
                                              password = true;
                                            });
                                          }
                                        },
                                        icon: Icon((password == true)
                                            ? Icons.visibility_off
                                            : Icons.remove_red_eye),
                                        color: Colors.green[400],
                                      ),
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
                                    border:
                                        Border.all(color: Colors.green[400])),
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
                                          fontFamily:
                                              "TheStudentsTeacher-Regular",
                                          fontSize: 20,
                                        ),
                                      ),
                                      onPressed: () async {
                                        if (validateSaved()) {
                                          providerEmploye
                                              .postSuperviseur(
                                                  matricule: _myMatricule)
                                              .then((value) async {
                                            if (value == false) {
                                              setState(() {
                                                info = true;
                                              });
                                            } else {
                                              final prefs =
                                                  await SharedPreferences
                                                      .getInstance();
                                              var pseudo = prefs.setString(
                                                  'my_Matricule',
                                                  '$_myMatricule');
                                              Navigator.of(context)
                                                  .pushNamedAndRemoveUntil(
                                                'bottomBarAdmin',
                                                (Route<dynamic> route) => false,
                                              );
                                            }
                                          });
                                          // var response =
                                          //     providerEmploye.wheremail(
                                          //         _myMatricule, _myPassword);
                                          // print(response);
                                          // if (response != null) {
                                          //   setState(() {
                                          //     loaded = true;
                                          //     result = true;
                                          //   });

                                          //   DBProvider.db
                                          //       .createSuperviseur(response);
                                          //   final prefs =
                                          //       await SharedPreferences
                                          //           .getInstance();
                                          //   var pseudo = prefs.setString(
                                          //       'my_Matricule',
                                          //       '$_myMatricule');
                                          //   Navigator.of(context)
                                          //       .pushNamedAndRemoveUntil(
                                          //     'bottomBar',
                                          //     (Route<dynamic> route) => false,
                                          //   );
                                          // } else {
                                          //   setState(() {
                                          //     info = true;
                                          //   });
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
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 28.0),
                            child: Text('Matricule ou Password Incorrect',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold)),
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
