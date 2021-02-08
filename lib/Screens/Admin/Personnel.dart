import 'package:flutter/material.dart';
import 'package:gestpersonnel/Providers/Models/DB_provider.dart';
import 'package:gestpersonnel/Providers/Models/Employe.dart';
import 'package:gestpersonnel/Providers/Models/EmployerDB.dart';
import 'package:gestpersonnel/Providers/Models/Motif.dart';
import 'package:gestpersonnel/Providers/Services/Employes.dart';
import 'package:gestpersonnel/Providers/Services/Presences.dart';
import 'package:gestpersonnel/Screens/Admin/ListePresence.dart';
import 'package:provider/provider.dart';
import 'package:gestpersonnel/Providers/Services/Motifs.dart';

class Personnel extends StatefulWidget {
  @override
  _PersonnelState createState() => _PersonnelState();
}

class _PersonnelState extends State<Personnel> {
  // did
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    DBProvider.db.getAllEmploye();
    print(DBProvider.db.itemSuperviseur[0].id);
    final providerEmploye = Provider.of<Employes>(context);
    providerEmploye.postSuperviseurEmploye(
        matricule: DBProvider.db.itemSuperviseur[0].id);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.replay_outlined),
        onPressed: () {
          setState(() {});
          DBProvider.db.getAllEmploye();
          DBProvider.db.getAllPresence();
          DBProvider.db.getAllAbsence();
        },
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.green[400]),
        backgroundColor: Colors.white,
        title: Text(
          "List de Personnel",
          style: TextStyle(color: Colors.green[400]),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        // decoration: BoxDecoration(color: Colors.red),
        child: FutureBuilder(
          future: DBProvider.db.getAllEmploye(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            // print(snapshot.data);
            if (snapshot.data?.isEmpty == true) {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  valueColor:
                      new AlwaysStoppedAnimation<Color>(Colors.green[400]),
                  strokeWidth: 3,
                ),
              );
            }
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  valueColor:
                      new AlwaysStoppedAnimation<Color>(Colors.green[400]),
                  strokeWidth: 3,
                ),
              );
            } else {
              return GridView.builder(
                itemCount: snapshot.data.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        (orientation == Orientation.portrait) ? 2 : 3),
                itemBuilder: (BuildContext context, int index) {
                  final Employe eleve = snapshot.data[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Card(
                      child: new GridTile(
                        footer: Container(
                          height: 40,
                          width: 120,
                          decoration: BoxDecoration(color: Colors.green[400]),
                          child: MaterialButton(
                              child: Text(
                                'Pointage',
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialoge(
                                        employe: eleve,
                                      );
                                    });
                              }),
                        ),
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.green[400],
                              maxRadius: 20,
                              child: Icon(Icons.person, color: Colors.white),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("${eleve.nom} ${eleve.prenoms}"),
                          ],
                        ), //just for testing, will fill with image later
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

class AlertDialoge extends StatefulWidget {
  final Employe employe;

  const AlertDialoge({Key key, this.employe}) : super(key: key);
  @override
  _AlertDialogeState createState() => _AlertDialogeState();
}

class _AlertDialogeState extends State<AlertDialoge> {
  bool info = true;
  bool vidibility = true;
  bool opacite = false;
  bool existe = false;
  bool loaded = false;
  bool result = false;
  bool motif = false;
  bool resultabs = false;
  int dropdownValue = 1;
  bool resultprs = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print(resultabs);
    final providerProducts = Provider.of<Motifs>(context);
    final dataProduct = providerProducts.items;
    final providerPresence = Provider.of<Presences>(context);
    return (loaded == true)
        ? Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.green[400],
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                strokeWidth: 3,
              ),
            ),
          )
        : AlertDialog(
            title: Text('Pointage',
                style: TextStyle(
                    fontFamily: "TheStudentsTeacher-Regular",
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            content: (opacite == true)
                ? Container(
                    height: MediaQuery.of(context).size.height / 6,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Center(
                        child: CircularProgressIndicator(
                      backgroundColor: Colors.white,
                      valueColor:
                          new AlwaysStoppedAnimation<Color>(Colors.green[400]),
                      strokeWidth: 3,
                    )),
                  )
                : Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height / 4,
                    width: MediaQuery.of(context).size.width / 4,
                    child: (resultabs == true)
                        ? Text('Pointé Absent',
                            style: TextStyle(
                                color: Colors.red[400],
                                fontWeight: FontWeight.bold))
                        : (resultprs == true)
                            ? Text('Pointé Présent',
                                style: TextStyle(
                                    color: Colors.green[400],
                                    fontWeight: FontWeight.bold))
                            : SingleChildScrollView(
                                child: Column(
                                  children: [
                                    MaterialButton(
                                        color: Colors.green[400],
                                        child: Container(
                                          width: 100,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Icon(
                                                Icons.check,
                                                color: Colors.white,
                                              ),
                                              Text('Arrivé',
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                            ],
                                          ),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            resultabs = false;
                                            print(widget.employe.id);
                                          });
                                          providerPresence
                                              .postArrive(
                                                  idMotif: widget.employe.id)
                                              .then((value) {
                                            setState(() {
                                              loaded = true;
                                            });

                                            if (value == true) {
                                              print(value);
                                              setState(() {
                                                loaded = false;
                                                motif = false;
                                                resultprs = true;
                                                resultabs = false;
                                                print(resultprs);
                                              });
                                            } else {}
                                          });
                                        }),
                                    MaterialButton(
                                        color: Colors.red[400],
                                        child: Container(
                                          width: 100,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Icon(
                                                Icons.close,
                                                color: Colors.white,
                                              ),
                                              Text('Absent',
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                            ],
                                          ),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            motif = true;
                                            resultabs = false;
                                          });
                                        }),
                                    (motif == true)
                                        ? Row(
                                            children: [
                                              Expanded(
                                                flex: 3,
                                                child: Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      12,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.white)),
                                                  child: DropdownButton<int>(
                                                    underline: null,
                                                    isExpanded: true,
                                                    value: dropdownValue,
                                                    iconSize: 24,
                                                    elevation: 16,
                                                    onChanged: (newValue) {
                                                      setState(() {
                                                        resultabs = false;
                                                        print(newValue);
                                                        dropdownValue =
                                                            newValue;
                                                      });
                                                    },
                                                    items: providerProducts
                                                        .items
                                                        .map((value) {
                                                      return DropdownMenuItem(
                                                        value: value.id,
                                                        child: Text(
                                                          value.libelle,
                                                        ),
                                                      );
                                                    }).toList(),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 2,
                                              ),
                                              Expanded(
                                                child: MaterialButton(
                                                  color: Colors.blue[400],
                                                  child: Text(
                                                    'OK',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  onPressed: () {
                                                    providerPresence
                                                        .postAbsences(
                                                            codeEmploye: widget
                                                                .employe.id,
                                                            idMotif:
                                                                dropdownValue)
                                                        .then((value) {
                                                      setState(() {
                                                        loaded = true;
                                                      });
                                                      if (value == true) {
                                                        print(value);
                                                        setState(() {
                                                          loaded = false;
                                                          motif = false;
                                                          resultabs = true;
                                                        });
                                                      } else {}
                                                    });
                                                  },
                                                ),
                                              )
                                            ],
                                          )
                                        : Text('')
                                  ],
                                ),
                              ),
                  ),
            actions: [
              (resultabs = true)
                  ? MaterialButton(
                      child: Text('Retour'),
                      onPressed: () {
                        setState(() {
                          resultabs = false;
                        });
                        Navigator.pop(context);
                      })
                  : (resultprs == true)
                      ? MaterialButton(
                          child: Text('Retour'),
                          onPressed: () {
                            setState(() {
                              resultprs = false;
                            });
                            Navigator.pop(context);
                          })
                      : Text('')
            ],
          );
  }
}
