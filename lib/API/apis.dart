// ignore_for_file: use_build_context_synchronously, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:onlinebookhubapp/screens/btm_bar.dart';

class APIs {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static signUp(String email, String password, String name, String address,
      BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'name': name,
        'address':address,
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Signup successful')));

      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => BottomBarScreen()));
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  static signIn(String email, String password, BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => BottomBarScreen()));
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}