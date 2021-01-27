import 'package:flutter/material.dart';
import 'package:gestpersonnel/Providers/Models/DB_provider.dart';
import 'package:gestpersonnel/Providers/Models/Employe.dart';
import 'package:gestpersonnel/Providers/Models/EmployerDB.dart';
import 'package:gestpersonnel/Providers/Services/Employes.dart';
import 'package:provider/provider.dart';

class Presence extends StatefulWidget {
  @override
  _PresenceState createState() => _PresenceState();
}

class _PresenceState extends State<Presence> {
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
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.green[400]),
        backgroundColor: Colors.white,
        title: Text(
          "List de Présence",
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
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                        valueColor: new AlwaysStoppedAnimation<Color>(
                            Colors.green[400]),
                        strokeWidth: 3,
                      ),
                    );
                  }
                  final Employe eleve = snapshot.data[index];
                  return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new Card(
                        child: Container(
                          height: MediaQuery.of(context).size.height / 8,
                          width: MediaQuery.of(context).size.width,
                          // decoration: BoxDecoration(color: Colors.green[400]),
                          child: InkWell(
                            splashColor: Colors.green[400],
                            onTap: () => null,
                            child: Container(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.green[400]),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 18,
                                    child: ListTile(
                                      title:
                                          Text('${eleve.nom} ${eleve.prenoms}'),
                                      trailing: Text('zea'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ));
                },
              );
            }
          },
        ),
      ),
    );
  }
}
