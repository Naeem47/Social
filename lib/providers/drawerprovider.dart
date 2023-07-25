
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social/screens/Personaldetail.dart';

class drawerProvider extends ChangeNotifier{

   

  home(context)  {
    Navigator.pop(context);
    notifyListeners();
  }
  profile(context){
    Navigator.push(context, MaterialPageRoute(builder: (context) => Perosnalinfo(),));
    notifyListeners();
  }
  logout(context){
    FirebaseAuth.instance.signOut();
    notifyListeners();
  }

  final List tiles = [
    'H O M E',
    'P R O F I L E',
    'L O G O U T',
  ];
  final List<Icon> icons = [
    const Icon(Icons.home),
    const Icon(Icons.person_2),
    const Icon(Icons.logout),
  ];
}