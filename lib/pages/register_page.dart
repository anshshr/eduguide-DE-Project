// ignore_for_file: avoid_print, unnecessary_null_comparison, use_build_context_synchronously, prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../db operations/user_database.dart';
import '../my widgets/my_button.dart';
import '../my widgets/my_dialog.dart';
import '../my widgets/my_textfield.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirm_pass = TextEditingController();
  bool obs = true;
  bool conf_obs = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Stack(children: [
        Image.network(
          'https://img.freepik.com/free-vector/gradient-glassmorphism-horizontal-banner_23-2149440108.jpg',
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
        Center(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              height: MediaQuery.of(context).size.height * 0.9,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //welcome text
                  Text(
                    'WELCOME BUDDY, REGISTER YOURSELF HERE',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //name

                  my_textfield(
                      hint_text: 'Enter your name',
                      obs_text: false,
                      controlller: name),
                  SizedBox(
                    height: 30,
                  ),

                  //email
                  my_textfield(
                      hint_text: 'Enter your email here',
                      obs_text: false,
                      controlller: email),
                  SizedBox(
                    height: 30,
                  ),

                  // password

                  my_textfield(
                    hint_text: 'Enter your password here',
                    obs_text: obs,
                    controlller: password,
                    icon: IconButton(
                        onPressed: () {
                          setState(() {
                            obs = !obs;
                          });
                        },
                        icon: obs
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off)),
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  //confirm password
                  my_textfield(
                    hint_text: 'Confirm password',
                    obs_text: conf_obs,
                    controlller: confirm_pass,
                    icon: IconButton(
                        onPressed: () {
                          setState(() {
                            conf_obs = !conf_obs;
                          });
                        },
                        icon: conf_obs
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off)),
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  //register button
                  my_button(
                    text: 'R E G I S T E R',
                    ontap: () async {
                      print('entered');
                      if (name.text != "" &&
                          name.text != null &&
                          email.text != "" &&
                          name.text != null) {
                        if (password.text != "" &&
                            confirm_pass.text != "" &&
                            password.text == confirm_pass.text) {
                          print('going to create user');
                          await user_create(name.text.toString(),
                              email.text.toString(), password.text.toString());
                          print('user created');
                          SharedPreferences pref =
                              await SharedPreferences.getInstance();
                          print(pref.getString('name'));
                          print('prefernce created');
                          if (pref.getString('name') != "" &&
                              pref.getString('name') != null) {
                            print('going to login');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ));
                          } else {
                            dialog(
                              context,
                              pref.getString('error_msg')!,
                            );
                          }
                        } else {
                          dialog(
                            context,
                            "Passwords Don't match",
                          );
                        }
                      } else {
                        dialog(context, 'Please Fill all the Details');
                      }
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account , ',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            color: Colors.black),
                      ),
                      GestureDetector(
                        child: const Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Colors.red),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ));
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
