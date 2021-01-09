import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          'Titre de la Demande',
                          style:
                              TextStyle(fontSize: 18, color: Colors.green[400]),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height / 12,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.green[400])),
                          child: TextFormField(
                            onChanged: (String val) {
                              setState(() {
                                titreDemande = val;
                              });
                            },
                            style: TextStyle(color: Colors.teal[900]),
                            decoration: InputDecoration(
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              border: UnderlineInputBorder(),
                            ),
                            maxLines: 1,
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
                          style:
                              TextStyle(fontSize: 18, color: Colors.green[400]),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height / 6,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.green[400])),
                          child: TextFormField(
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
                                border: Border.all(color: Colors.green[400])),
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
                          style:
                              TextStyle(fontSize: 18, color: Colors.green[400]),
                        ),
                        InkWell(
                          onTap: () => _selectDateTimeFin(context),
                          child: Container(
                            alignment: Alignment.center,
                            height: MediaQuery.of(context).size.height / 12,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.green[400])),
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
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10),
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
                            setState(() {
                              // user.prenom = "<<Bonjour";
                              // print(password);
                              // print(titreDemande);
                              // print(genre);
                              // print(email);
                              // provider.addUser(user);
                            });
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
