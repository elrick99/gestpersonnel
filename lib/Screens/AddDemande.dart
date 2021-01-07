import 'package:flutter/material.dart';

enum TypeOptions { Particulier, Createur, Bloggeur, VenderPro }

class AddDemande extends StatefulWidget {
  const AddDemande({Key key}) : super(key: key);
  @override
  _AddDemandeState createState() => _AddDemandeState();
}

class _AddDemandeState extends State<AddDemande> {
  bool _obscureText = true;
  bool genreF = true;
  bool genreM = false;
  bool _checkBoxval = false;
  bool _checkBoxval1 = false;
  String genre = "";
  String prenom = "";
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          title: Text(
            "CREER MON COMPTE",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          SizedBox(
            height: 10,
          ),
          Container(
            height: MediaQuery.of(context).size.height / 1.4,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 6,
                      width: MediaQuery.of(context).size.width,
                      // decoration: BoxDecoration(color: Colors.red),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Genre',
                            style: TextStyle(fontSize: 18),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 10,
                            // decoration: BoxDecoration(color: Colors.red),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      genre = "Femme";
                                      setState(() {
                                        genreF = true;
                                        genreM = false;
                                      });
                                    },
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height,
                                      decoration: BoxDecoration(
                                          color: (genreF == false)
                                              ? Colors.white
                                              : Colors.black,
                                          border: Border.all(
                                              color: (genreF == false)
                                                  ? Colors.black
                                                  : Colors.white)),
                                      child: Center(
                                        child: Text('FEMME',
                                            style: TextStyle(
                                                color: (genreF == false)
                                                    ? Colors.black
                                                    : Colors.white)),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      genre = "Homme";
                                      setState(() {
                                        genreM = true;
                                        genreF = false;
                                      });
                                    },
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height,
                                      decoration: BoxDecoration(
                                          color: (genreM == true)
                                              ? Colors.black
                                              : Colors.white,
                                          border: Border.all(
                                              color: (genreM == true)
                                                  ? Colors.white
                                                  : Colors.black)),
                                      child: Center(
                                        child: Text(
                                          'HOMME',
                                          style: TextStyle(
                                              color: (genreM == true)
                                                  ? Colors.white
                                                  : Colors.black),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
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
                          'Prénom',
                          style: TextStyle(fontSize: 18),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height / 12,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                          child: TextFormField(
                            onChanged: (String val) {
                              setState(() {
                                prenom = val;
                              });
                            },
                            decoration: InputDecoration(
                              focusedBorder: InputBorder.none,
                              border: UnderlineInputBorder(),
                            ),
                            maxLines: 1,
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
                          'Adresse E-mail ',
                          style: TextStyle(fontSize: 18),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height / 12,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                          child: TextFormField(
                            onChanged: (String val) {
                              setState(() {
                                email = val;
                              });
                            },
                            decoration: InputDecoration(
                              focusedBorder: InputBorder.none,
                              border: UnderlineInputBorder(),
                            ),
                            maxLines: 1,
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
                          'Mot de passe ',
                          style: TextStyle(fontSize: 18),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height / 12,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                          child: TextFormField(
                            obscureText: _obscureText,
                            onChanged: (String val) {
                              setState(() {
                                password = val;
                              });
                            },
                            decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                                child: Icon(_obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                              ),
                              filled: true,
                              focusedBorder: InputBorder.none,
                              border: UnderlineInputBorder(),
                            ),
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            // height: MediaQuery.of(context).size.height / 1.8,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Colors.white),
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      // decoration: BoxDecoration(color: Colors.red),
                      child: Column(
                        children: [
                          Text(
                            'Niveau de securite:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      // decoration: BoxDecoration(color: Colors.red),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                  onChanged: (bool value) {
                                    setState(
                                      () {
                                        this._checkBoxval = value;
                                      },
                                    );
                                  },
                                  value: this._checkBoxval),
                              Container(
                                height: 30,
                                width: 200,
                                child: Text(
                                  'Je souhaite recevoir les offres de NanShope',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Checkbox(
                                  onChanged: (bool value) {
                                    setState(
                                      () {
                                        this._checkBoxval1 = value;
                                      },
                                    );
                                  },
                                  value: this._checkBoxval1),
                              Container(
                                height: 30,
                                width: 200,
                                child: Text(
                                  'Je souhaite recevoir les offres de patenaire de NanShope',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 6,
                    width: MediaQuery.of(context).size.width,

                    // decoration: BoxDecoration(color: Colors.red),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              // user.prenom = "<<Bonjour";
                              print(password);
                              print(prenom);
                              print(genre);
                              print(email);
                              // provider.addUser(user);
                            });
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height / 12,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.black,
                            ),
                            child: Center(
                              child: Text(
                                'CREER UN COMPTE',
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
          SizedBox(
            height: 10,
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10),
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 7,
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        'Le vendeur, s\'il se presente comme un consommateur ou un non-professionnel, alors qu\'il agit à titre professionnel, en court des sanctions',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              )),
          Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 20.0, bottom: 10),
                  child: Column(children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 7,
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        'Le vendeur, s\'il se presente comme un consommateur ou un non-professionnel, alors qu\'il agit à titre professionnel, en court des sanctions',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ])))
        ])));
  }
}
