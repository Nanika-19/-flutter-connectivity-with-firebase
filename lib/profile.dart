import 'package:firebase_app/Login1.dart';
import 'package:firebase_app/Login1.dart';
import 'package:firebase_app/model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'Login1.dart';

class Profile extends StatefulWidget {
  Model user;

  Profile(this.user);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  StorageReference storageReference =
      FirebaseStorage.instance.ref().child("profile");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 130,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 300,
                child: Card(
                  margin: EdgeInsets.only(left: 0, right: 0),
                  color: Colors.lightBlueAccent,
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60)),
                ),
              ),
            ),
            Positioned(
              top: 70,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 70,
                  backgroundImage: NetworkImage(widget.user.profilePic),
                  //  backgroundImage: NetworkImage(
                        //"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8oUbwzY315xqfyJ9AIfGC6eg9TSl6pKBS6uf5K4BwEokUjC4suA"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      widget.user.fname + " " + widget.user.lname,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontFamily: "Bangers-Regular"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Text(widget.user.email,
                        style: TextStyle(
                          fontFamily: "Bangers-Regular",
                          color: Colors.white70,
                          fontSize: 30,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 45),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: Text("Logout",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1)),
                      color: Colors.white,
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => Login1()));
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
