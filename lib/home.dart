import 'package:firebase_app/model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Model user;


  Home(this.user);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Center(child: Text("")),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
           //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: <Widget>[

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                      "Hi "+widget.user.fname+" " + widget.user.lname,

                    style: TextStyle(color: Colors.white,fontStyle: FontStyle.italic,fontSize: 20.0),
                  ),

                ),
              ),
              Text(widget.user.email),



            ],
          ),
        ),

        //Text( widget.user.email),
      ),
    );
  }
}
