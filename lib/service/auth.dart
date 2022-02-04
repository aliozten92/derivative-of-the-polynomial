import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //login
  Future<User> singIn(String email, String password) async{
    var user = await _auth.signInWithEmailAndPassword(email: email, password: password);
    return user.user;
  }
  //exit
  signOut() async{
    return await _auth.signOut();
  }
  //register
  Future<User> createPerson(String name,String email, String password) async{
    var user = await _auth.createUserWithEmailAndPassword(email: email, password: password);

    await _firestore.collection("User")
        .doc(user.user.uid)
        .set({'userName' : name, 'email' : email});

    return user.user;
  }


}