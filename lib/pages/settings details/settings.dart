// ignore_for_file: prefer_const_literals_to_create_immutables, use_build_context_synchronously, prefer_const_constructors

import 'package:eduguide/pages/liquid%20swipe/swipe_pages.dart';
import 'package:eduguide/pages/payments/offers_page.dart';
import 'package:eduguide/pages/settings%20details/developer_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'about_page.dart';
import 'forms.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  Widget my_card(String text, VoidCallback ontap, Icon my_icon) {
    return GestureDetector(
      onTap: ontap,
      child: Card(
        margin: EdgeInsets.only(bottom: 35),
        shadowColor: Colors.grey,
        borderOnForeground: true,
        color: Colors.white,
        elevation: 20,
        child: ListTile(
            title: Text(
              text,
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
            trailing: my_icon),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.indigo,
        appBar: AppBar(
          title: Text(
            'S E T T I N G S',
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
          centerTitle: true,
          backgroundColor: Colors.indigo[100],
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.only(top: 50, left: 15, right: 15, bottom: 50),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                Colors.indigo[100]!,
                Colors.indigo[200]!,
                Colors.indigo[300]!,
                Colors.indigo[300]!,
                Colors.indigo[200]!,
              ])),
          child: SingleChildScrollView(
            child: Column(
              children: [
                my_card('ABOUT APP', () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AboutPage(),
                      ));
                }, Icon(Icons.description, size: 30, color: Colors.black87)),
                my_card('REPORT A PROBLEM', () async {
                  await problem_dialog(context);
                }, Icon(Icons.report_problem, size: 30, color: Colors.black87)),
                my_card('FEEDBACK', () async {
                  await feedback_dialog(context);
                }, Icon(Icons.feedback, size: 30, color: Colors.black87)),
                my_card('DEVELOPER DETAILS', () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DeveloperPage(),
                      ));
                }, Icon(Icons.person, size: 30, color: Colors.black87)),
                 my_card('PAYMENT SECTION', () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OffersPage(),
                      ));
                }, Icon(Icons.payment, size: 30, color: Colors.black87)),
                my_card('LOGOUT', () async {
                  SharedPreferences pref =
                      await SharedPreferences.getInstance();
                  await pref.clear();
                  await pref.setBool('login', false);
                  await FirebaseAuth.instance.signOut();

                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SwipePages(),
                    ),
                    (Route<dynamic> route) => false,
                  );
                }, Icon(Icons.logout, size: 30, color: Colors.black87)),
               
              ],
            ),
          ),
        ));
  }
}
