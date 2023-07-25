import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social/screens/home.dart';
import 'package:social/screens/login.dart';

class Authpage extends StatelessWidget {
  const Authpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(stream:FirebaseAuth.instance.authStateChanges() ,builder:(context, snapshot) {
        if(snapshot.hasData){
          return  HomeView();
        }else{
         return  LOGINVIEW();
        }
      } , ),
    );
  }
}