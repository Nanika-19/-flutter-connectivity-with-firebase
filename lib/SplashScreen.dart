import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/profile.dart';
import 'package:firebase_app/uploadImg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Login1.dart';
import 'model.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  var screen;
  Model model;

  checkUser() {
    FirebaseAuth.instance.currentUser().then((user) {
      if (user == null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Login1()));
      } else {
        Firestore.instance
            .collection("users")
            .document(user.uid)
            .get()
            .then((doc) {
          setState(() {
            model = Model(doc.data["fname"], doc.data["lname"], user.email, "",
                uid: user.uid);
          });
          if (doc.data["profilepic"] != null) {
            setState(() {
           Model model1 = Model(
                  doc.data["fname"], doc.data["lname"], user.email, "",
                  uid: user.uid, profilePic: doc.data["profilepic"]);

              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => Profile(model1)));
              //screen = Profile(model);
            });
          } else {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => UploadImage(model)));
          }
        });
      }
    });
  }

  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      checkUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Loading")),
    );
  }
}
