
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';


class ProfilePage extends StatefulWidget {

  _cameraAppState createState() => _cameraAppState();

}


class _cameraAppState extends State<ProfilePage>{

  File imageFile;


 /* _openGallery(BuildContext context) async{
    var picture =  await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState((){
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }*/

  _openCamera(BuildContext context) async{
    var picture =  await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState((){
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  Future<void> _showChoiseDialog(BuildContext context) {
    return showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[


              GestureDetector(
                child: Text("Camera"),
                onTap: (){
                  _openCamera(context);
                },
              ),

            ],
          ),
        ),
      );
    });
  }


  Widget _decideImageView(){

    if(imageFile == null)
    {
      return Text(
          " "
      );
    }
    else
    {
      return Image.file(imageFile,
        width: 400,
        height: 500,);
    }
  }
  Future uploadPic(BuildContext context) async{
    String fileName = basename(imageFile.path);
    StorageReference firebaseStorageRef = FirebaseStorage.instance.ref().child(fileName);
    StorageUploadTask uploadTask = firebaseStorageRef.putFile(imageFile);
    StorageTaskSnapshot taskSnapshot=await uploadTask.onComplete;
    setState(() {
      print("Picture uploaded");
      Scaffold.of(context).showSnackBar(SnackBar(content: Text('Picture Uploaded')));
    });
  }

  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.purple.shade100,
      appBar: AppBar(
        title: Text("rescuing the world"),
        backgroundColor: Colors.purple.shade400,
      ),

      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _decideImageView(),
              RaisedButton(
                color: Colors.blueGrey,
                onPressed: (){
                  _showChoiseDialog(context);
                },
                child: Text("SEND IMAGE"),
              )
            ],
          ),
        ),
      ),
    );
  }



}
































