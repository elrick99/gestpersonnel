import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:gestpersonnel/Providers/Models/DB_provider.dart';
import 'package:gestpersonnel/Screens/Client/AddDemande.dart';
import 'package:gestpersonnel/Screens/Client/Home.dart';
import 'package:gestpersonnel/Screens/Client/ListDemandes.dart';
import 'package:provider/provider.dart';
import 'package:gestpersonnel/Providers/Services/Permissionss.dart';

class BottomBar extends StatefulWidget {
  BottomBar({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> with TickerProviderStateMixin {
  int _currentIndex = 0;
  int _counter = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final providerPermission = Provider.of<Permissionss>(context);
    DBProvider.db.getAllEmploye();
    // if (DBProvider.db.itemEmploye != null) {
    //   providerPermission.getPermission(
    //       idEmploye: DBProvider.db.itemSuperviseur[0].matricule);
    // }

    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            HomeScreen(),
            AddDemande(),
            ListDemandes(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(Icons.apps),
            title: Text('Home'),
            activeColor: Colors.green[400],
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.plumbing),
            title: Text('Envoyé une Permission'),
            activeColor: Colors.green[400],
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.list),
            title: Text(
              'Liste Permission',
            ),
            activeColor: Colors.green[400],
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
