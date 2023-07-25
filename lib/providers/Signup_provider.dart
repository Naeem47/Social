import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social/constants/Colors.dart';
import 'package:social/screens/login.dart';

class SignupProvider with ChangeNotifier {
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController cpassword = TextEditingController();
  
  createUser(context) async {
 
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      email.clear();
      password.clear();
      cpassword.clear();
      await FirebaseFirestore.instance.collection('Users').add({
        'email' : FirebaseAuth.instance.currentUser!.email,
        'User name ' : FirebaseAuth.instance.currentUser!.email?.split('@'),
        'bio' :'Hey there ! I am using Feedbook',

      });
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LOGINVIEW()),);
    } on FirebaseAuthException catch (e) {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: ColorConstant.grey,
              content: Text(
                e.message.toString(),
                style: GoogleFonts.rubik(color: ColorConstant.black),
              ),
            );
          });
          
    
          }
          notifyListeners();
    }

  }

