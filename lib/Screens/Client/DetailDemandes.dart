import 'package:flutter/material.dart';
import 'package:gestpersonnel/Providers/Models/Permission.dart';

class DetailsDemandes extends StatefulWidget {
  final Permission permission;

  const DetailsDemandes({Key key, this.permission}) : super(key: key);
  @override
  _DetailsDemandesState createState() => _DetailsDemandesState();
}

class _DetailsDemandesState extends State<DetailsDemandes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.green[400]),
        title: Text(
          "Details Demande",
          style: TextStyle(color: Colors.green[400]),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              child: Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                // decoration: BoxDecoration(color: Colors.amber),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 10,
                        // decoration: BoxDecoration(color: Colors.blue),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(widget.permission.createdAt.split(' ')[0],
                                    style: TextStyle(
                                        fontFamily: "LTReponse Rounded",
                                        fontWeight: FontWeight.bold)),
                                Text(widget.permission.createdAt.split(' ')[1],
                                    style: TextStyle(
                                        fontFamily: "LTReponse Rounded",
                                        fontWeight: FontWeight.bold))
                              ],
                            ),
                          ),
                        ),
                      ),
                      Text(
                        widget.permission.idMotif,
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "LTReponse Rounded",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Divider(
                        indent: 8.0,
                        endIndent: 8.0,
                        height: 2,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 3,
                        child: ListView(
                          scrollDirection: Axis.vertical,
                          children: [
                            Text(
                              widget.permission.description,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: "LTReponse Rounded"),
                            ),
                            Text('\n \n du',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: "LTReponse Rounded")),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "${widget.permission.datePermission} - ${widget.permission.dateAutorisation}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: "LTReponse Rounded"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              child: Container(
                height: MediaQuery.of(context).size.height / 8,
                width: MediaQuery.of(context).size.width,
                // decoration: BoxDecoration(color: Colors.red),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Etat de Votre Demande:',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      'En Attente',
                      style: TextStyle(
                          color: Colors.amber,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
