import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social/screens/home.dart';
import '../constants/Colors.dart';

class LoginProvider with ChangeNotifier {
  // controllers for textfield
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  // login func with credentials
  login(context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>   HomeView() ,));
      email.clear();
      password.clear();
      
    } on FirebaseAuthException catch (e) {
    
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: ColorConstant.grey,
              content: Text(
                e.message.toString(),
                style: GoogleFonts.rubik(color: ColorConstant.blue),
              ),
            );
          });
    }

    notifyListeners();
  }
}
