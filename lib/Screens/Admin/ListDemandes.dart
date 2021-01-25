import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gestpersonnel/Providers/Models/DB_provider.dart';
import 'package:gestpersonnel/Screens/Client/DetailDemandes.dart';
import 'package:provider/provider.dart';
import 'package:gestpersonnel/Providers/Services/Permissionss.dart';

class ListDemandes extends StatefulWidget {
  @override
  _ListDemandesState createState() => _ListDemandesState();
}

class _ListDemandesState extends State<ListDemandes> {
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
        final providerPermission =
            Provider.of<Permissionss>(context, listen: false);
        DBProvider.db.getAllEmploye();
        if (DBProvider.db.itemEmploye != null) {
          providerPermission.getPermission(
              idEmploye: DBProvider.db.itemEmploye[0].matricule);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.green[400]),
        backgroundColor: Colors.white,
        title: Text(
          "Liste de mes Demandes",
          style: TextStyle(color: Colors.green[400]),
        ),
      ),
      body: FutureBuilder(
          future: DBProvider.db.getAllPermission(),
          builder: (context, snapshot) {
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView.separated(
                  itemCount: DBProvider.db.itemPermission?.length ?? 0,
                  separatorBuilder: (context, index) => SizedBox(
                        height: 10,
                      ),
                  itemBuilder: (context, index) {
                    return Container(
                      height: MediaQuery.of(context).size.height / 8,
                      width: MediaQuery.of(context).size.width,
                      // decoration: BoxDecoration(color: Colors.green[400]),
                      child: InkWell(
                        splashColor: Colors.green[400],
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailsDemandes(
                                      permission:
                                          DBProvider.db.itemPermission[index],
                                    ))),
                        child: Card(
                          child: Container(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration:
                                        BoxDecoration(color: Colors.green[400]),
                                  ),
                                ),
                                Expanded(
                                  flex: 18,
                                  child: ListTile(
                                    title: Container(
                                        width: 300,
                                        // decoration: BoxDecoration(color: Colors.red),
                                        child: Text(
                                            '${DBProvider.db.itemPermission[index].idMotif}')),
                                    trailing: Container(
                                      child: Text(
                                          '${DBProvider.db.itemPermission[index].createdAt.split(' ')[0]}'),
                                      // decoration: BoxDecoration(color: Colors.red),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            );
          }),
    );
  }
}
