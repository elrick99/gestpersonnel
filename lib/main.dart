import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gestpersonnel/Providers/Services/Employes.dart';
import 'package:gestpersonnel/Providers/Services/Presences.dart';
import 'package:gestpersonnel/Providers/Services/Superviseurs.dart';
import 'package:gestpersonnel/Screens/Accueil.dart';
import 'package:gestpersonnel/Screens/Admin/Connexion.dart';
import 'package:gestpersonnel/Screens/Client/Connexion.dart';
import 'package:gestpersonnel/Screens/Admin/BotttomBar.dart';
import 'package:gestpersonnel/Screens/Client/BotttomBar.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gestpersonnel/Providers/Services/Permissionss.dart';
import 'package:gestpersonnel/Providers/Services/Motifs.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Employes(),
        ),
        ChangeNotifierProvider.value(
          value: Permissionss(),
        ),
        ChangeNotifierProvider.value(
          value: Superviseurs(),
        ),
        ChangeNotifierProvider.value(
          value: Motifs(),
        ),
        ChangeNotifierProvider.value(
          value: Presences(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Vonabri',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.green,
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(),
        routes: {
          'bottomBar': (context) => BottomBar(),
          'bottomBarAdmin': (context) => BottomBarAdmin(),
          'connexion': (context) => Connexion(),
          'accueil': (context) => Accueil()
        },
        // home: Connexion(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String my_Matricule;
  String my_MatriculeE;
  getPrefIdUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      my_MatriculeE = sharedPreferences.getString('my_MatriculeE');
      my_Matricule = sharedPreferences.getString('my_Matricule');
    });
  }

  @override
  void initState() {
    super.initState();
    getPrefIdUser();
    startTime();
  }

  startTime() async {
    var duration = new Duration(seconds: 3);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      if (my_MatriculeE != null) {
        return BottomBar();
      } else if (my_Matricule != null) {
        return BottomBarAdmin();
      } else {
        return Accueil();
      }
    }));
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return initScreen(context);
  }

  initScreen(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            CircularProgressIndicator(
              backgroundColor: Colors.white,
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.green[400]),
              strokeWidth: 3,
            )
          ],
        ),
      ),
    );
  }
}
