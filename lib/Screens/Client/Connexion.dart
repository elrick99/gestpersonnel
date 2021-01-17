import 'package:flutter/material.dart';

class Connexion extends StatefulWidget {
  @override
  _ConnexionState createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100.0, left: 20, right: 20),
                child: Container(
                  width: 200,
                  child:
                      Image(image: AssetImage("assets/AppIcons/playstore.png")),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                // decoration: BoxDecoration(color: Colors.blue),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(color: Colors.blue),
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
                              // showDialog(
                              //     context: context,
                              //     builder: (BuildContext context) {
                              //       return AlertDialoge();
                              //     });
                            }),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.grey,
                height: 20,
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
