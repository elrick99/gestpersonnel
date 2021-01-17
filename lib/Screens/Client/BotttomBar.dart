import 'package:flutter/material.dart';
import 'package:gestpersonnel/Screens/Client/AddDemande.dart';
import 'package:gestpersonnel/Screens/Client/Home.dart';
import 'package:gestpersonnel/Screens/Client/ListDemandes.dart';
import 'package:motion_tab_bar/MotionTabBarView.dart';
import 'package:motion_tab_bar/MotionTabController.dart';
import 'package:motion_tab_bar/motiontabbar.dart';

class BottomBar extends StatefulWidget {
  BottomBar({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> with TickerProviderStateMixin {
  MotionTabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = MotionTabController(initialIndex: 1, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: MotionTabBar(
          labels: ["Liste", "Demande", "Profil"],
          initialSelectedTab: "Demande",
          tabIconColor: Colors.green[400],
          tabSelectedColor: Colors.green[400],
          onTabItemSelected: (int value) {
            // print(value);
            setState(() {
              _tabController.index = value;
            });
          },
          icons: [Icons.menu, Icons.add, Icons.home_filled],
          textStyle: TextStyle(color: Colors.green[400]),
        ),
        body: MotionTabBarView(
          controller: _tabController,
          children: <Widget>[
            ListDemandes(),
            AddDemande(),
            HomeScreen(),
          ],
        ));
  }
}
