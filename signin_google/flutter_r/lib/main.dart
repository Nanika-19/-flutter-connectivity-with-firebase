import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_r/main1.dart';
import 'package:flutter_r/main2.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MyApp3(),

      ),


    );
  }
}


/*
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.blue,Colors.pink],begin: Alignment.bottomRight,end: Alignment.topLeft)),
          //height:MediaQuery.of(context).size.height,
          //width: MediaQuery.of(context).size.width,
         // color: Colors.blue,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center ,
            children: <Widget>[
              Image.asset('assets/monuments.png'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                      prefix: Icon(Icons.person),
                      labelText: "Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0)),
                      labelStyle: TextStyle(
                        color: Colors.white,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration( prefix: Icon(Icons.not_listed_location),
                    labelText: "Where you from ?",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),

                    ),
                    labelStyle: TextStyle(
                      color: Colors.white
                    )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    prefix: Icon(Icons.favorite),
                    labelText: "Tall me the name what you like ?",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(25.0))
                      ,labelStyle: TextStyle(color: Colors.white)
                  ),
                ),
              ),
              RaisedButton(
                child: Text("Login"),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
                  onPressed: ( ){

                  }

              )

            ],
          ),
        ),
      ),
    );
  }
}*/
