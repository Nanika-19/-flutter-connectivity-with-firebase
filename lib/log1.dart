import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Log1 extends StatefulWidget {
  @override
  _Log1State createState() => _Log1State();
}

class _Log1State extends State<Log1> {
  Future<GoogleSignInAccount> googleSignInAccount(
      GoogleSignIn googleSignIn) async {
    GoogleSignInAccount signInAccount = googleSignIn.currentUser;
    if (signInAccount == null) {
      signInAccount = await googleSignIn.signIn();
    }
    return signInAccount;
  }

  Future<AuthResult> signintoFirebase(
      GoogleSignInAccount googleSignInAccount) async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    GoogleSignInAuthentication googleauth = await googleSignInAccount.authentication;
    print(googleauth.accessToken);
    return await firebaseAuth.signInWithCredential(
        GoogleAuthProvider.getCredential(
            idToken: googleauth.idToken, accessToken: googleauth.accessToken));
  }

  GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            child: Text("Sign In With Google"),
          ),
          RaisedButton(
            child: Text("SinIn"),
            onPressed: () {

              googleSignInAccount(googleSignIn).then((account){
                if(account!=null) {
                  signintoFirebase(account).then((authResult) {
                    print(authResult.user.uid + authResult.user.email +
                        authResult.user.displayName);
                  });
                }});
            },
          )
        ],
      ),
    );
  }
}
