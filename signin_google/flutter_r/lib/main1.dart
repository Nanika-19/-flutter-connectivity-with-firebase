

import 'package:flutter/material.dart';

class MyApp2 extends StatefulWidget {
  @override
  _MyApp2State createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.blueGrey,Colors.grey],begin: Alignment.topCenter,end: Alignment.bottomCenter) ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  decoration: InputDecoration(border: OutlineInputBorder(
                    borderRadius:BorderRadius.circular(50.0)
                  ),
                    labelText: "Name",
                    labelStyle: TextStyle(color: Colors.black)
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  decoration: InputDecoration(border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50z.0)
                  ),
                      labelText: "Addres",
                      labelStyle: TextStyle(color: Colors.black)
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
