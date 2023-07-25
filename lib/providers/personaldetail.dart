import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social/screens/login.dart';

class PersonalProvider extends ChangeNotifier {
  TextEditingController username = TextEditingController();
  TextEditingController bio = TextEditingController();
  TextEditingController portfolio = TextEditingController();

  late File? profilepic;

  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  pickimage() async {
    final XFile? pickedfile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedfile != null) {
      File finalimge = File(pickedfile.path);
      profilepic = finalimge;
    } else {
      return " no image selected";
    }

    notifyListeners();
  }

  sendata(context) async {
    // UploadTask uploadTask =FirebaseStorage.instance.ref().child("Profilepictures").child(const Uuid().v1()).putFile(profilepic!);
    // TaskSnapshot taskSnapshot = await uploadTask;
    //  String downloadURL   = await   taskSnapshot.ref.getDownloadURL();

    try {
      await FirebaseFirestore.instance.collection("users").add({
        'username': username.text,
        'bio': bio.text,
        'portfolio': portfolio.text,
        'email': FirebaseAuth.instance.currentUser!.email,
      }).then(
        (value) => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LOGINVIEW(),
            )),
      );
      username.clear();
      bio.clear();
      portfolio.clear();
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }
}
