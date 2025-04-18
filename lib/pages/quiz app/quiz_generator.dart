// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

import '../../my widgets/my_button.dart';
import '../../my widgets/my_dialog.dart';
import '../../my widgets/my_textfield.dart';
import 'start_quiz_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: QuizGenerator(),
  ));
}

class QuizGenerator extends StatefulWidget {
  const QuizGenerator({super.key});

  @override
  State<QuizGenerator> createState() => _QuizGeneratorState();
}

class _QuizGeneratorState extends State<QuizGenerator> {
  TextEditingController topic = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController level = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 22).copyWith(top: 50),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Hello , I am Arya(A.I. assistant)',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                SizedBox(height: 10,),
                //space for animation
                Lottie.network(
                  'https://lottie.host/c14d4558-399e-47a7-8e18-4b31445dbbc5/flA9LAwGHe.json',
                ),

                SizedBox(
                  height: 30,
                ),
                Text("Let's start learning , Please fill all the Details",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),

                //field for topic
                my_textfield(
                    hint_text: 'Enter your topic',
                    obs_text: false,
                    controlller: topic),
                SizedBox(
                  height: 30,
                ),

                //field for number of questions
                my_textfield(
                    hint_text: 'Enter the number of questions',
                    obs_text: false,
                    controlller: number),
                SizedBox(
                  height: 30,
                ),

                //field for diffculty level
                my_textfield(
                    hint_text: 'Enter the level of questions',
                    obs_text: false,
                    controlller: level),

                SizedBox(
                  height: 10,
                ),

                //button for starting the quiz.
                my_button(
                    text: 'START QUIZ',
                    ontap: () {
                      if (topic.text.isNotEmpty &&
                          number.text.isNotEmpty &&
                          level.text.isNotEmpty) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => QuizStart(
                                difficulty: level.text,
                                topic: topic.text,
                                value: number.text,
                              ),
                            ));
                      } else {
                        dialog(context, 'Please Fill all the Details');
                      }
                    })
              ],
            ),
          )),
    );
  }
}
