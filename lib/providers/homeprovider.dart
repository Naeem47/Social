import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier{
 final TextEditingController post = TextEditingController();
 postmessage(email,context)async{
 await  FirebaseFirestore.instance.collection("Feed").add({
    'Messege' : post.text,
    'Email'  : email,
    'TimeStamp' : Timestamp.now(),
    'Likes' : [],
  });
  post.clear();
  Navigator.pop(context);
 }



}