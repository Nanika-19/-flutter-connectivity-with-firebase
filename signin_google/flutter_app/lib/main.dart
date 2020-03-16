
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String number="";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: TextField(
              decoration: InputDecoration(
                labelText: "enter a value"
              ),
              onChanged: (value){
                number=value;
                if(number=null){
                  print("value not entered");
                }
                else{
                GridView.builder(itemCount:number.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                     itemBuilder: (BuildContext context, index){
                  index++;
                  return  Card(
                    elevation: 0.5,
                    child: Align(
                      alignment: Alignment.center,
                        child: Text("$index")),
                  );
                     });}

              },



            )
          ),
        ),
      ),
    );
  }
}
