import 'package:flutter/material.dart';
import 'package:gestpersonnel/Providers/Models/DB_provider.dart';
import 'package:gestpersonnel/Screens/Admin/Home.dart';
import 'package:gestpersonnel/Screens/Admin/ListDemandes.dart';
import 'package:gestpersonnel/Screens/Admin/Presence.dart';
import 'package:motion_tab_bar/MotionTabBarView.dart';
import 'package:motion_tab_bar/MotionTabController.dart';
import 'package:motion_tab_bar/motiontabbar.dart';
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
    final providerPermission = Provider.of<Permissionss>(context);
    DBProvider.db.getAllSuperviseur();
    print(DBProvider.db.itemSuperviseur?.length);
    return Scaffold(
        bottomNavigationBar: MotionTabBar(
          labels: ["Liste", "Profil", "Demande"],
          initialSelectedTab: "Profil",
          tabIconColor: Colors.green[400],
          tabSelectedColor: Colors.green[400],
          onTabItemSelected: (int value) {
            // print(value);
            setState(() {
              _tabController.index = value;
            });
          },
          icons: [Icons.assignment_turned_in, Icons.person_outline, Icons.add],
          textStyle: TextStyle(color: Colors.green[400]),
        ),
        body: MotionTabBarView(
          controller: _tabController,
          children: <Widget>[ListDemandes(), HomeScreen(), Presence()],
        ));
  }
}
