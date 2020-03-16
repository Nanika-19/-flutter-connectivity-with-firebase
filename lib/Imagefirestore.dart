import 'package:flutter/material.dart';

class ImageFirestore extends StatefulWidget {
  @override
  _ImageFirestoreState createState() => _ImageFirestoreState();
}

class _ImageFirestoreState extends State<ImageFirestore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
        Column(
          children: <Widget>[
            CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8oUbwzY315xqfyJ9AIfGC6eg9TSl6pKBS6uf5K4BwEokUjC4suA"),
            ),
            RaisedButton(

            )
          ],
        ),



    );
  }
}
