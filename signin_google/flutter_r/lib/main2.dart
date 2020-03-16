import 'package:flutter/material.dart';

class MyApp3 extends StatefulWidget {
  @override
  _MyApp3State createState() => _MyApp3State();
}

class _MyApp3State extends State<MyApp3> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: <Widget>[

            Positioned(
              top:10,
              child: Container(
                height: 500,
                width:MediaQuery.of(context).size.width ,
                child: Card(
                  elevation: 8,


                ),
              ),
            )
          ],
        )

        ,
      ),
    );
  }
}
