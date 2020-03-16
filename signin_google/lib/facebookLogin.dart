import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class Facebook extends StatefulWidget {
  @override
  _FacebookState createState() => _FacebookState();
}

class _FacebookState extends State<Facebook> {


  facebookLogin() async {
    FacebookLogin facebookLogin = FacebookLogin();
    FacebookLoginResult result = await facebookLogin.logIn(
        ["email", "public_profile"]);
    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        FirebaseAuth.instance.signInWithCredential(
            FacebookAuthProvider.getCredential(
                accessToken: result.accessToken.token));
        print(result.accessToken.token);
        break;
      case FacebookLoginStatus.cancelledByUser:
        print("Facebook SignIn cancel by user");
        break;
      case FacebookLoginStatus.error:
        print("Facebook signIn Failed");
        break;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: MediaQuery
                .of(context)
                .size
                .width,
            height: MediaQuery
                .of(context)
                .size
                .height,
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 10,
                  child: Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: 210,
                    child: Card(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 50),
                            child: Text("Login",style: TextStyle(
                                color: Colors.white,fontStyle: FontStyle.italic,fontSize: 30)),
                          ),
                        ],
                      ),

                      margin: EdgeInsets.only(left: 0, right: 0),
                      color: Colors.lightBlueAccent,
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30))),
                    ),
                  ),
                ),
                Positioned(
                  top: 150,
                  child: Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: 800,
                    child: Card(
                      child: Column(
                        children: <Widget>[



                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: RaisedButton(
                                color: Colors.lightBlueAccent,

                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),

                                child: Text(
                                    "Login With facebook", style: TextStyle(
                                    color: Colors.white)),
                                onPressed: () {
                                  facebookLogin();
                                }),
                          )

                        ],
                      ),

                      margin: EdgeInsets.only(left: 8, right: 8),
                      color: Colors.white,
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                ),
              ],

            )

        )
    );


    /*Scaffold(
      body: Column(
        children: <Widget>[
          Text("Login with facebook"),
          RaisedButton(
              child: Text("Login With facebook")
              , onPressed:(){facebookLogin();},
          )
        ],
      ),
    );
  }**/
  }
}