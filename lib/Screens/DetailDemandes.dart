import 'package:flutter/material.dart';

class DetailsDemandes extends StatefulWidget {
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
          "Details Demandes",
          style: TextStyle(color: Colors.green[400]),
        ),
      ),
    );
  }
}
