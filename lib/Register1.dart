import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/Login1.dart';
import 'package:firebase_app/home.dart';
import 'package:firebase_app/main.dart';
import 'package:firebase_app/model.dart';
import 'package:firebase_app/profile.dart';
import 'package:firebase_app/uploadImg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  Model model;
  String fname="";
  String lname="";
  String email = "";
  String password = "";
  String confirmPassword = "";

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
          title: Center(child: Text("Registaration")),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  //controller: fnameController,
                  style: TextStyle(color: Colors.white),

                  decoration: InputDecoration(
                      labelText: "FirstName",
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
                      fname = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  //controller: lnameController,
                  decoration: InputDecoration(
                      labelText: "LastName",
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
                      lname = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                 // controller: emailController,
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
                 // controller: passwordController,
                  obscureText: true,
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
                      password = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                 // controller: confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: " Confirm Password",
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
                      confirmPassword = value;
                    });
                  },
                ),
              ),
              RaisedButton(
                child: Text(
                  "Register",
                  style: TextStyle(color: Colors.blueGrey),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                onPressed: () {
                  if (fname.isNotEmpty&&lname.isNotEmpty&&email.isNotEmpty &&
                      password.isNotEmpty &&
                      confirmPassword.isNotEmpty) {

                    if(!validateEmail(email)){
                      Toast.show(
                          "Enter valid email",
                          context, duration: Toast.LENGTH_LONG,
                          gravity: Toast.BOTTOM);
                    }else {
                      Toast.show(
                          "Please wait while we are creating your account",
                          context, duration: Toast.LENGTH_LONG,
                          gravity: Toast.BOTTOM);
                      FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                          email: email, password: password)
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
                          Firestore.instance
                              .collection("users")
                              .document(result.user.uid)
                              .setData({
                            "fname": fname,
                            "lname": lname,
                          }).then((value) {
                            model = Model(fname, lname, email, password,uid: result.user.uid);
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => UploadImage(model)));
                          });
                        }
                      });
                    }}else{
                    Toast.show("Please enter details", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);

                  }
                }
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  "Already Registered?",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              FlatButton(
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => Login1()));
                  })
            ],
          ),
        ),
      ),
    );
  }
}
