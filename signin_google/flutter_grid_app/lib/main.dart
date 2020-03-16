import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String number = "";
  int index;
  bool color=true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SizedBox(
          height: 500,
          child: GridView.builder(
              itemCount: 5,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (BuildContext context, index) {
                index++;
//                color =
//                    Colors.primaries[Random().nextInt(Colors.primaries.length)];
                return GestureDetector(
                  child: Card(
                    color: color ?  Colors.primaries[Random().nextInt(Colors.primaries.length)] : Colors.white,
                    elevation: 5,
                    child: Text("$index"),
                  ),
                  onTap: () {
                    setState(() {
                      color =! color;
                    });
                  },
                );
              }),
        ),
      ),
    );
  }
}

