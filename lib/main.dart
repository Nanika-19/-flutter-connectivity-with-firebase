import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/Imagefirestore.dart';
import 'package:firebase_app/Login1.dart';
import 'package:firebase_app/home.dart';
import 'package:firebase_app/log1.dart';
import 'package:firebase_app/profile.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'Register1.dart';
import 'SplashScreen.dart';
import 'model.dart';

void main() => runApp(MyApp());
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home:Scaffold(
        body: Log1(),
      ) ,
    );
  }
}


/*class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FirebaseMessaging firebaseMessaging = FirebaseMessaging();
  String _message = " ";
  String   homeToken="";

  @override
  void initState() {
    firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print(message);
        setState(() {
          _message = message["notification"]["tittle"];
        });
        Flushbar(
          title: "$_message",
          message: message["notification"]["body"],
        );
      },
      onLaunch: (Map<String, dynamic> message) async {
        print(message);
        setState(() {
          _message = message["notification"]["tittle"];
        });
      },
      onResume: (Map<String, dynamic> message) async {
        print(message);
        setState(() {
          _message = message["notification"]["tittle"];
        });
      },
    );
    firebaseMessaging.requestNotificationPermissions(const IosNotificationSettings(sound: true,alert: true));
    firebaseMessaging.onIosSettingsRegistered.listen((IosNotificationSettings setting){
      print(setting);

    });

  }
  getToken(){
    firebaseMessaging.getToken().then((token) {
      print(token);
      setState(() {
        homeToken="Token: $token";
      });
      print(homeToken);

    }

    );


  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[
              Text("Message:$_message"),
              OutlineButton(
                  child: Text("Register My Device"),
                  onPressed: () {
                           getToken ();


                  })
            ],
          ),
        ),
      ),
    );
    for login screen
    //MaterialApp(
    //debugShowCheckedModeBanner: false,
    // title: "First App",

    //home: SplashPage(),
    //);
  }
}*/
