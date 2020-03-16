import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/model.dart';
import 'package:firebase_app/profile.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toast/toast.dart';

class UploadImage extends StatefulWidget {
  Model model;

  UploadImage(this.model);

  @override
  _UploadImageState createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  File image;
  String imageName;
  StorageReference storageReferene;
  StorageUploadTask uploadTask;
  String url;
  Model model;
  //StorageReference storageReference= FirebaseStorage.instance.ref().child("F:\flutterimages\profile.jpg");
  //StorageUploadTask uploadTask=storageReference.putFile(File("F:\flutterimages\profile.jpg"),StorageMetadata(contentType: ),);

  Future profilePicker() async {
    image = await ImagePicker.pickImage(source: ImageSource.gallery);
    Toast.show("Loading Image from Gallery", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
    return image;
  }

  Future upload() async {
    StorageTaskSnapshot downloadurl = await (uploadTask.onComplete);
    url = await downloadurl.ref.getDownloadURL();
    return url;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.black, Colors.blueGrey],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar( elevation: 0,
          backgroundColor: Colors.transparent,),

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              InkWell(
                onTap: () {
                  profilePicker().then((value) {
                    setState(() {
                      image = value;
                    });
                    storageReferene = FirebaseStorage.instance.ref().child(
                        "profile_" + widget.model.email);
                    uploadTask =
                        storageReferene.putFile(File(image.path), StorageMetadata(
                          contentType: "image" + "/" + "jpg",
                        ));
                    //Toast.show("Loading Image from Gallery", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
                    //StorageTaskSnapshot downloadurl= await (uploadTask.onComplete);
                    upload().then((url) {
                      Firestore.instance.collection("users")
                          .document(widget.model.uid)

                          .updateData({"profilepic": url,
                      }).then((value) {
                        print("file stored");
                      }).then((value) {
                        print(widget.model.uid);
                       model = Model(
                            widget.model.fname, widget.model.lname, widget.model.email,
                            widget.model.password, uid: widget.model.uid,
                            profilePic: url);
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Profile(model)));
                      });
                    });
                  });
                },
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,

                  radius: 110,
                  backgroundImage: image == null
                      ? AssetImage("images/images2.jpg")
                      : FileImage(image),

                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text("Please select profile photo",style: TextStyle(fontFamily: "Bangers-Regular",color: Colors.white,fontSize: 15),),
              )
            ],
          ),
        ),

      ),
    );
  }
}
