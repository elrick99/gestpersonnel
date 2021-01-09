import 'package:flutter/material.dart';
import 'package:gestpersonnel/Screens/DetailDemandes.dart';

class ListDemandes extends StatefulWidget {
  @override
  _ListDemandesState createState() => _ListDemandesState();
}

class _ListDemandesState extends State<ListDemandes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Liste de mes Demandes",
          style: TextStyle(color: Colors.green[400]),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.separated(
            itemCount: 10,
            separatorBuilder: (context, index) => SizedBox(
                  height: 10,
                ),
            itemBuilder: (context, index) {
              return Container(
                height: MediaQuery.of(context).size.height / 8,
                width: MediaQuery.of(context).size.width,
                // decoration: BoxDecoration(color: Colors.green[400]),
                child: InkWell(
                  splashColor: Colors.green[400],
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailsDemandes())),
                  child: Card(
                    child: Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration:
                                  BoxDecoration(color: Colors.green[400]),
                            ),
                          ),
                          Expanded(
                            flex: 18,
                            child: ListTile(
                              title: Container(
                                  width: 300,
                                  // decoration: BoxDecoration(color: Colors.red),
                                  child: Text('Demandes $index')),
                              trailing: Container(
                                child: Text('14h0${index + 2}'),
                                // decoration: BoxDecoration(color: Colors.red),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
