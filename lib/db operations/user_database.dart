
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eduguide/widgets/my_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//creating the user
Future<void> user_create(String name, String email, String password) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    pref.setString('name', name);
    pref.setString('email', email);
    pref.setString('error_msg', "");
  } on FirebaseAuthException catch (e) {
    pref.setString('error_msg', e.code);
  }
}

//logging in a user
Future<void> login_user(String email, String password) async {
  SharedPreferences pref = await SharedPreferences.getInstance();

  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    pref.setString('email', email);
    pref.setString('error_msg', "");

    String? userRole = pref.getString('user_role');
    if (userRole != null) {
      // Assuming you have a Firestore instance set up
      final firestore = FirebaseFirestore.instance;

      await firestore.collection('user_type').doc(email).set({
      'name': pref.getString('name'),
      'email': email,
      'role': userRole,
      });
    }
  } on FirebaseAuthException catch (e) {
    pref.setString('error_msg', e.code);
  }
}

//reset password of a user
Future<void> reset_password(context, email) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  try {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Password Updated Succesfully',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            my_button(
                text: 'OKAY',
                ontap: () {
                  Navigator.pop(context);
                })
          ],
        );
      },
    );
  } on FirebaseAuthException catch (e) {
    pref.setString('error_msg', e.code);
  }
}
