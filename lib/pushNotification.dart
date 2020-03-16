import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class PushNotification extends StatefulWidget {
  @override
  _PushNotificationState createState() => _PushNotificationState();
}

class _PushNotificationState extends State<PushNotification> {
  FirebaseMessaging firebaseMessaging= FirebaseMessaging();
  String _message=" ";


  @override
  void initState() {
    setState(() {
      getMessage();
    });

  }


  register(){
    firebaseMessaging.getToken().then((token)=>print(token));
  }


  void getMessage(){
    firebaseMessaging.configure(
      onMessage: (Map<String,dynamic> message) async{
      print(message);
      setState(() {
        _message = message["notification"]["tittle"];
      });
    }) ;

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
              child: Text("Register My Device")
              ,onPressed: (){
                register();

              })
            ],
          ),
        ),
      ),
    );
  }
}
