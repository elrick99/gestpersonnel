import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gestpersonnel/Providers/Models/DB_provider.dart';
import 'package:gestpersonnel/Screens/Client/ListDemandes.dart';
import 'package:gestpersonnel/Widgets/DropDownMenu.dart';
import 'package:provider/provider.dart';
import 'package:gestpersonnel/Providers/Services/Permissionss.dart';

enum TypeOptions { Particulier, Createur, Bloggeur, VenderPro }

class AddDemande extends StatefulWidget {
  const AddDemande({Key key}) : super(key: key);
  @override
  _AddDemandeState createState() => _AddDemandeState();
}

class _AddDemandeState extends State<AddDemande> {
  String titreDemande = "";
  String _descripDemande = "";
  String _dateTextDebut = " ";
  String _dateTextFin = " ";
  String _years = " ";
  String dropdownValue = 'Absence non justifiée';
  bool loaded = false;
  DateTime _dateTime = new DateTime.now();

  Future<Null> _selectDateTimeDebut(BuildContext context) async {
    final picked = await showDatePicker(
        context: context,
        initialDate: _dateTime,
        firstDate: DateTime(2019),
        lastDate: DateTime(2050));
    if (picked != null) {
      setState(() {
        _dateTime = picked;
        _dateTextDebut = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  Future<Null> _selectDateTimeFin(BuildContext context) async {
    final picked = await showDatePicker(
        context: context,
        initialDate: _dateTime,
        firstDate: DateTime(
            int.parse(_dateTextDebut.split('/')[2]),
            int.parse(_dateTextDebut.split('/')[1]),
            int.parse(_dateTextDebut.split('/')[0])),
        lastDate: DateTime(2050));
    if (picked != null) {
      setState(() {
        _dateTime = picked;
        _dateTextFin = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  Timer timer;
  @override
  void initState() {
    // TODO: implement initState
    timer = Timer.periodic(Duration(seconds: 5), (Timer t) => refresh());
    super.initState();
  }

  refresh() async {
    if (this.mounted) {
      setState(() {
        DBProvider.db.getAllEmploye();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (DBProvider.db.itemEmploye == null) {
      return Scaffold(
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
      );
    }
    return (loaded == true)
        ? Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Colors.white),
            child: Center(
                child: CircularProgressIndicator(
              backgroundColor: Colors.white,
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.green[400]),
              strokeWidth: 3,
            )))
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.black),
              backgroundColor: Colors.white,
              title: Text(
                "Faire une Demande",
                style: TextStyle(color: Colors.green[400]),
              ),
            ),
            body: SingleChildScrollView(
                child: Column(children: [
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 6,
                        width: MediaQuery.of(context).size.width,
                        // decoration: BoxDecoration(color: Colors.red),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Motif de la Demande',
                              style: TextStyle(
                                  fontSize: 18, color: Colors.green[400]),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height / 12,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.green[400])),
                              child: DropdownButton<String>(
                                underline: null,
                                isExpanded: true,
                                value: dropdownValue,
                                iconSize: 24,
                                elevation: 16,
                                onChanged: (String newValue) {
                                  setState(() {
                                    dropdownValue = newValue;
                                  });
                                },
                                items: <String>[
                                  'Absence non justifiée',
                                  'Affection',
                                  'Arrêt de travail pour accident de travaux personnel à but lucratif',
                                  'Arrêt de travail pour accident domestique',
                                  'Arrêt de travail pour accident du trajet hors service',
                                  'Arrêt de travail pour accident du travail',
                                  'Arrêt de travail pour accident sportif hors service',
                                  'Arrêt de travail pour maternité',
                                  'Arrêt de travail pour repos maladie',
                                  'Changement de catégorie',
                                  'Congé annuele',
                                  'Demande d\'explication',
                                  'Maladie non professionnelle',
                                  'Mise à disponibilité',
                                  'Mise à pieds',
                                  'Mutation',
                                  'Permission',
                                  'Promotion',
                                  'Renvoie',
                                  'Reprise de travail',
                                  'Sanctions',
                                  'Arrêt de travail pour accident du trajet de service'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 4,
                        width: MediaQuery.of(context).size.width,
                        // decoration: BoxDecoration(color: Colors.red),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Description de la demande',
                              style: TextStyle(
                                  fontSize: 18, color: Colors.green[400]),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height / 6,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.green[400])),
                              child: TextFormField(
                                autofocus: false,
                                validator: (value) {
                                  return value.isEmpty
                                      ? 'Description required'
                                      : null;
                                },
                                onChanged: (String valueDesc) {
                                  setState(() {
                                    _descripDemande = valueDesc;
                                  });
                                },
                                onSaved: (newValue) {
                                  _descripDemande = newValue;
                                },
                                style: TextStyle(color: Colors.teal[900]),
                                decoration: InputDecoration(
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  border: UnderlineInputBorder(),
                                ),
                                maxLines: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 6,
                        width: MediaQuery.of(context).size.width,
                        // decoration: BoxDecoration(color: Colors.red),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('Date Debut Permission',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.green[400])),
                            InkWell(
                              onTap: () => _selectDateTimeDebut(context),
                              child: Container(
                                alignment: Alignment.center,
                                height: MediaQuery.of(context).size.height / 12,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.green[400])),
                                child: Text(
                                  _dateTextDebut,
                                  style: TextStyle(
                                      fontSize: 22.0, color: Colors.teal[900]),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 6,
                        width: MediaQuery.of(context).size.width,
                        // decoration: BoxDecoration(color: Colors.red),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Date Fin Permission',
                              style: TextStyle(
                                  fontSize: 18, color: Colors.green[400]),
                            ),
                            InkWell(
                              onTap: () => _selectDateTimeFin(context),
                              child: Container(
                                alignment: Alignment.center,
                                height: MediaQuery.of(context).size.height / 12,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.green[400])),
                                child: Text(
                                  _dateTextFin,
                                  style: TextStyle(
                                      fontSize: 22.0, color: Colors.teal[900]),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                // height: MediaQuery.of(context).size.height / 1.8,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 20.0, bottom: 10),
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 6,
                        width: MediaQuery.of(context).size.width,

                        // decoration: BoxDecoration(color: Colors.red),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () {
                                if (_dateTextDebut != null &&
                                    _dateTextFin != null &&
                                    _descripDemande != null &&
                                    dropdownValue != null) {
                                  setState(() {
                                    loaded = true;
                                  });
                                  final providerPermission =
                                      Provider.of<Permissionss>(context,
                                          listen: false);
                                  providerPermission
                                      .postPermissions(
                                          codeEmploye: DBProvider
                                              .db.itemEmploye[0].matricule,
                                          dateD: _dateTextDebut,
                                          dateF: _dateTextFin,
                                          desciption: _descripDemande,
                                          motif: dropdownValue)
                                      .then((value) {
                                    setState(() {
                                      loaded = false;
                                    });
                                    if (value == true) {
                                      _dateTextDebut = '';
                                      _dateTextFin = '';
                                      _descripDemande = '';
                                      dropdownValue = 'Absence non justifiée';
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertMessageEffectue(
                                              etat: true,
                                            );
                                          });
                                    } else {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertMessageEffectue(
                                              etat: false,
                                            );
                                          });
                                    }
                                  });
                                  setState(() {
                                    // user.prenom = "<<Bonjour";
                                    // print(password);
                                    // print(titreDemande);
                                    // print(genre);
                                    // print(email);
                                    // provider.addUser(user);
                                  });
                                }
                              },
                              child: Container(
                                height: MediaQuery.of(context).size.height / 12,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.green[400],
                                ),
                                child: Center(
                                  child: Text(
                                    'ENVOYE LA DEMANDE',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ])));
  }
}

class AlertMessageEffectue extends StatefulWidget {
  final bool etat;
  const AlertMessageEffectue({Key key, this.etat}) : super(key: key);
  @override
  _AlertMessageEffectueState createState() => _AlertMessageEffectueState();
}

class _AlertMessageEffectueState extends State<AlertMessageEffectue> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: MediaQuery.of(context).size.height / 6,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text((widget.etat == true)
                  ? 'Votre demande a bien été envoyé'
                  : 'Votre demande a échoué'),
              SizedBox(
                height: 20,
              ),
              CircleAvatar(
                backgroundColor:
                    (widget.etat == true) ? Colors.green[400] : Colors.red,
                child: Icon(Icons.check, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
      actions: [
        MaterialButton(
          color: Colors.green[400],
          child: Text(
            'OK',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ListDemandes()),
            );
          },
        )
      ],
    );
  }
}
