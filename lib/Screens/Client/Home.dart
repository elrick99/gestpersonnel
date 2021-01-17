import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[400],
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 11,
                      // color: Colors.grey,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon:
                                Icon(Icons.more_vert, color: Colors.green[400]),
                            onPressed: () {},
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      // decoration: BoxDecoration(color: Colors.green),
                      child: Column(
                        children: [
                          CircleAvatar(
                            maxRadius: 35,
                          ),
                          Text("Hira Riaz",
                              style: TextStyle(
                                  color: Colors.teal[900],
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                          Text(
                            "Designer",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('2000',
                                    style: TextStyle(
                                        color: Colors.teal[900],
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                Text(
                                  'Total Demandes',
                                  style: TextStyle(fontSize: 10),
                                )
                              ],
                            ),
                          ),
                          Container(
                            color: Colors.green[200],
                            height: 60,
                            width: 1,
                          ),
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('1000',
                                    style: TextStyle(
                                        color: Colors.teal[900],
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                Text(
                                  'Demandes Acceptées',
                                  style: TextStyle(fontSize: 10),
                                )
                              ],
                            ),
                          ),
                          Container(
                            color: Colors.green[200],
                            height: 60,
                            width: 1,
                          ),
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('1000',
                                    style: TextStyle(
                                        color: Colors.teal[900],
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                Text(
                                  'Demandes Réfusées',
                                  style: TextStyle(fontSize: 10),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )),
              SizedBox(
                child: Container(
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('OverView',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold)),
                      Text(
                        'sept, 13 2020',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  // decoration: BoxDecoration(color: Colors.pink),
                  child: ListView(
                    children: [
                      Container(
                          height: MediaQuery.of(context).size.height / 9,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: ListTile(
                              leading: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: Colors.green[400],
                                    borderRadius: BorderRadius.circular(10)),
                                child: Icon(
                                  Icons.my_library_books,
                                  color: Colors.white,
                                ),
                              ),
                              title: Text('Vos Demandes',
                                  style: TextStyle(
                                      color: Colors.teal[900],
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold)),
                              subtitle: Text("Liste de Vos Demandes"),
                              trailing: Text('2000',
                                  style: TextStyle(
                                      color: Colors.teal[900],
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                            ),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          height: MediaQuery.of(context).size.height / 9,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: ListTile(
                              leading: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: Colors.green[400],
                                    borderRadius: BorderRadius.circular(10)),
                                child: Icon(
                                  Icons.check_box,
                                  color: Colors.white,
                                ),
                              ),
                              title: Text('Demande Acceptée',
                                  style: TextStyle(
                                      color: Colors.teal[900],
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold)),
                              subtitle: Text("Vox demandes acceptées"),
                              trailing: Text('1000',
                                  style: TextStyle(
                                      color: Colors.teal[900],
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                            ),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          height: MediaQuery.of(context).size.height / 9,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: ListTile(
                              leading: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: Colors.green[400],
                                    borderRadius: BorderRadius.circular(10)),
                                child: Icon(Icons.close, color: Colors.white),
                              ),
                              title: Text('Demande Refusées',
                                  style: TextStyle(
                                      color: Colors.teal[900],
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold)),
                              subtitle: Text("Vox demandes Refusées"),
                              trailing: Text('1000',
                                  style: TextStyle(
                                      color: Colors.teal[900],
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
