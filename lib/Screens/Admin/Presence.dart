import 'package:flutter/material.dart';

class Presence extends StatefulWidget {
  @override
  _PresenceState createState() => _PresenceState();
}

class _PresenceState extends State<Presence> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.green[400]),
        backgroundColor: Colors.white,
        title: Text(
          "List de Présence",
          style: TextStyle(color: Colors.green[400]),
        ),
      ),
    );
  }
}
