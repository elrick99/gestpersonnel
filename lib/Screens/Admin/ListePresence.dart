import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gestpersonnel/Providers/Models/Absence.dart';
import 'package:gestpersonnel/Providers/Models/DB_provider.dart';
import 'package:gestpersonnel/Providers/Models/Presence.dart';
import 'package:gestpersonnel/Providers/Services/Presences.dart';
import 'package:provider/provider.dart';

class Listepresence extends StatefulWidget {
  @override
  _ListepresenceState createState() => _ListepresenceState();
}

class _ListepresenceState extends State<Listepresence> {
  // Timer timer;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   // WidgetsBinding.instance.addPostFrameCallback(_showOpenDialog);
  //   timer = Timer.periodic(Duration(seconds: 3), (Timer t) => refresh());
  //   super.initState();
  // }

  // refresh() async {
  //   print('////////NOTES////////');
  //   if (this.mounted) {
  //     setState(() {
  //       // final providerMoyenne = Provider.of<Moyennes>(context, listen: false)
  //       //     .getMoyenne(eleve: widget.eleve);
  //       DBProvider.db.getAllPresence();
  //       // DBProvider.db.getAllMatiere();
  //       // reload = true;
  //     });
  //   }
  // }

  // @override
  // void dispose() {
  //   timer?.cancel();
  //   super.dispose();
  // }

  Widget _presense() {
    DBProvider.db.getAllSuperviseur();
    final providerPresence = Provider.of<Presences>(context)
        .getPresence(idSup: DBProvider.db.itemSuperviseur[0].id);
    // print(DBProvider.db.itePresence?.length);
    return FutureBuilder(
      future: DBProvider.db.getAllPresence(),
      builder: (context, snapshot) {
        return ListView.builder(
          itemCount: DBProvider.db.itePresence?.length ?? 0,
          itemBuilder: (context, index) {
            Presence presence = DBProvider.db.itePresence[index];
            return ListTile(
              trailing: Text("${DBProvider.db.itePresence?.length ?? 0}"),
              title: Text("${presence.nom} ${presence.prenoms}"),
              subtitle: Text("${presence.matricule}"),
            );
          },
        );
      },
    );
  }

  Widget _absence() {
    DBProvider.db.getAllSuperviseur();
    final providerPresence = Provider.of<Presences>(context)
        .getAbsence(idSup: DBProvider.db.itemSuperviseur[0].id);
    return FutureBuilder(
      future: DBProvider.db.getAllAbsence(),
      builder: (context, snapshot) {
        return ListView.builder(
          itemCount: DBProvider.db.iteAbsence?.length ?? 0,
          itemBuilder: (context, index) {
            Absence presence = DBProvider.db.iteAbsence[index];
            return ListTile(
              title: Text("${presence.nom} ${presence.prenoms}"),
              subtitle: Text("${presence.matricule}"),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.replay_outlined),
            onPressed: () {
              setState(() {});
              print(DBProvider.db.itePresence?.length);
              DBProvider.db.getAllSuperviseur();
              DBProvider.db.getAllAbsence();
              DBProvider.db.getAllPresence();
            },
          ),
          appBar: AppBar(
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.green[400]),
            centerTitle: true,
            // leading: Icon(Icons.person_outline),
            title: Text(
              'Pointage',
              style: TextStyle(color: Colors.black, fontSize: 16.0),
            ),
            bottom: PreferredSize(
                child: TabBar(
                    isScrollable: false,
                    unselectedLabelColor: Colors.white.withOpacity(0.3),
                    indicatorColor: Colors.green[400],
                    tabs: [
                      Tab(
                        child: Text(
                          'Présence',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Absence',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ]),
                preferredSize: Size.fromHeight(50.0)),
            // actions: <Widget>[
            //   Padding(
            //     padding: const EdgeInsets.only(right: 16.0),
            //     child: Icon(Icons.add_alert),
            //   ),
            // ],
          ),
          body: TabBarView(
            children: <Widget>[
              _presense(),
              _absence(),
            ],
          )),
    );
  }
}
