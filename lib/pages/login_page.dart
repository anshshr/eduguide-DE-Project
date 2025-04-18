// ignore_for_file: use_build_context_synchronously, unnecessary_null_comparison, prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../db operations/user_database.dart';
import '../my widgets/my_button.dart';
import '../my widgets/my_dialog.dart';
import '../my widgets/my_textfield.dart';
import 'get_started_page.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool obs_text = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Stack(children: [
        Image.network(
          'https://img.freepik.com/free-vector/gradient-blur-pink-blue-abstract-background_53876-117324.jpg?size=626&ext=jpg&ga=GA1.1.1700460183.1712793600&semt=sph',
          height: double.infinity,
          fit: BoxFit.cover,
          width: double.infinity,
          alignment: Alignment.center,
        ),
        Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //welcome text
                  Text(
                    'WELCOME BUDDY',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  //email
                  my_textfield(
                    hint_text: 'Enter your email here',
                    obs_text: false,
                    controlller: email,
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  //password
                  my_textfield(
                      hint_text: 'Enter your password here',
                      obs_text: obs_text,
                      controlller: password,
                      icon: IconButton(
                          onPressed: () {
                            setState(() {
                              obs_text = !obs_text;
                            });
                          },
                          icon: obs_text == true
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off))),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        child: Text(
                          'forgot password',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Colors.red),
                        ),
                        onTap: () async {
                          TextEditingController email = TextEditingController();
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(
                                  'UPDATE PASSWORD',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                actions: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  my_textfield(
                                      hint_text: 'Enter your registered email',
                                      obs_text: false,
                                      controlller: email),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  my_button(
                                      text: 'O K A Y',
                                      ontap: () async {
                                        Navigator.pop(context);
                                        await reset_password(
                                            context, email.text);
                                      })
                                ],
                              );
                            },
                          );
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  //submit
                  my_button(
                    text: 'L O G I N',
                    ontap: () async {
                      print('entered');
                      if ((password.text != "" || password.text != null) &&
                          (email.text != null || email.text != "")) {
                        SharedPreferences pref =
                            await SharedPreferences.getInstance();
                        print("pref created");
                        await login_user(email.text, password.text);
                        print(pref.getString('token'));
                        print(pref.getString('name'));
                        if (pref.getString('error_msg') == "") {
                          await pref.setBool('login', true);
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ),
                            (Route<dynamic> route) => false,
                          );
                        } else {
                          dialog(context, pref.getString('error_msg')!);
                        }
                      } else {
                        dialog(context, 'Password ad Email is required');
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account , ",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            color: Colors.black),
                      ),
                      GestureDetector(
                        child: Text(
                          'Register',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Colors.red),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterPage(),
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
