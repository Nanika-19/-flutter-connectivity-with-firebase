import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:signin_google/Login.dart';
import 'package:signin_google/facebookLogin.dart';

void main() => runApp(MyApp());
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
        body:Facebook() ,
      ),
    );
  }
}



// for google signin google
/*class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Login(),
      ),
    );
  }
}
*/
/*
for push ntifications
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FirebaseMessaging firebaseMessaging = FirebaseMessaging();
  String _message = " ";
  String homeToken = "";

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
    firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, alert: true));
    firebaseMessaging.onIosSettingsRegistered.listen((
        IosNotificationSettings setting) {
      print(setting);
    });
  }

  getToken() {
    firebaseMessaging.getToken().then((token) {
      print(token);
      setState(() {
        homeToken = "Token: $token";
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
                    getToken();
                  })
            ],
          ),
        ),
      ),
    );
  }
}*/