import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/Register1.dart';
import 'package:firebase_app/home.dart';
import 'package:firebase_app/main.dart';
import 'package:firebase_app/model.dart';
import 'package:firebase_app/profile.dart';
import 'package:firebase_app/uploadImg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class Login1 extends StatefulWidget {
  @override
  _Login1State createState() => _Login1State();
}

class _Login1State extends State<Login1> {
  FirebaseMessaging firebaseMessaging=FirebaseMessaging();
  Model model;
  String email = "";
  String pswd = "";
  bool validateEmail(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(email))
      return false;
    else
      return true;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.black, Colors.blueGrey],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Center(child: Text("Login")),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(8.0)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(20.0)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10))),
                  onChanged: (value) {
                    setState(() {
                      email = value;

                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(8.0)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(20.0)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10))),
                  onChanged: (value) {
                    setState(() {
                      pswd = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  child:
                      Text("Login", style: TextStyle(color: Colors.blueGrey)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  onPressed: () {
                    if (email.isNotEmpty && pswd.isNotEmpty) {
                      if(!validateEmail(email)){
                        Toast.show("Please enter valid email",
                            context,
                            duration: Toast.LENGTH_LONG,
                            gravity: Toast.BOTTOM);


                      }else{
                      Toast.show(
                          "Please wait while we are fetching your account",
                          context,
                          duration: Toast.LENGTH_LONG,
                          gravity: Toast.BOTTOM);
                      FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: email, password: pswd)
                          .then((result) {
                        if (result.user == null) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Error"),
                                  actions: <Widget>[
                                    FlatButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text("Close"))
                                  ],
                                );
                              });
                        } else {
                          Toast.show(
                              "Please wait while we are fetching your account",
                              context,
                              duration: Toast.LENGTH_SHORT,
                              gravity: Toast.BOTTOM);
                          Firestore.instance
                              .collection("users")
                              .document(result.user.uid)
                              .get()
                              .then((doc) {
                          //  model =  Model(doc.data["fname"],doc.data["lname"],result.user.email,"",doc.data["profilePic"]);
                            model=Model(doc.data["fname"], doc.data["lname"], result.user.email, result.user.uid,profilePic:doc.data["'profilePic"]);
                            if (doc.data["profilepic"] != null) {
                              setState(() {
                                Model model1 = Model(
                                    doc.data["fname"], doc.data["lname"], result.user.email, "",
                                    uid: result.user.uid, profilePic: doc.data["profilepic"]);

                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) => Profile(model1)));
                                //screen = Profile(model);
                              });
                            } else {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) => UploadImage(model)));
                            }
                          });
                          //Navigator.of(context).pushReplacement(
                          // MaterialPageRoute(builder: (context) => MyApp()));
                          /* showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Login sucessfull"),
                                  actions: <Widget>[
                                    FlatButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text("Close"))
                                  ],
                                );
                              });*/
                        }
                      });
                    } }else {
                      Toast.show("Please enter details", context,
                          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
                    }
                  }
                ),
              ),
              Text("Not yet  Registered?",
                  style: TextStyle(color: Colors.white)),
              FlatButton(
                child: Text("Register", style: TextStyle(color: Colors.white)),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Register()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
