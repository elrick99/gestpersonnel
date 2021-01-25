import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gestpersonnel/Providers/Services/Employes.dart';
import 'package:gestpersonnel/Providers/Services/Superviseurs.dart';
import 'package:gestpersonnel/Screens/Accueil.dart';
import 'package:gestpersonnel/Screens/Admin/Connexion.dart';
import 'package:gestpersonnel/Screens/Client/Connexion.dart';
import 'package:gestpersonnel/Screens/Admin/BotttomBar.dart';
import 'package:gestpersonnel/Screens/Client/BotttomBar.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gestpersonnel/Providers/Services/Permissionss.dart';

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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
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
          primarySwatch: Colors.blue,
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: ConnexionSuperviseur(),
        routes: {
          'bottomBar': (context) => BottomBar(),
          'bottomBarAdmin': (context) => BottomBarAdmin(),
          'connexion': (context) => Connexion(),
        },
        // home: Connexion(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String my_Matricule;
  getPrefIdUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
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
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                (my_Matricule == null) ? Accueil() : BottomBar()));
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
