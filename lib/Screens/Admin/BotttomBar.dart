import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:gestpersonnel/Providers/Models/DB_provider.dart';
import 'package:gestpersonnel/Screens/Admin/Home.dart';
import 'package:gestpersonnel/Screens/Admin/ListDemandes.dart';
import 'package:gestpersonnel/Screens/Admin/Presence.dart';
import 'package:gestpersonnel/Screens/Client/AddDemande.dart';
import 'package:provider/provider.dart';
import 'package:gestpersonnel/Providers/Services/Permissionss.dart';

class BottomBarAdmin extends StatefulWidget {
  BottomBarAdmin({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _BottomBarAdminState createState() => _BottomBarAdminState();
}

class _BottomBarAdminState extends State<BottomBarAdmin>
    with TickerProviderStateMixin {
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
    DBProvider.db.getAllSuperviseur();
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
            Presence(),
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
            icon: Icon(Icons.person_outline),
            title: Text('Home'),
            activeColor: Colors.green[400],
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.plumbing),
            title: Text('Présence'),
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
