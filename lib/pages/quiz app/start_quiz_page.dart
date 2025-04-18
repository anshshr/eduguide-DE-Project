// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names, must_be_immutable, prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../gemini/gemini_services.dart';
import '../../my widgets/my_button.dart';
import 'tts.dart';

class QuizStart extends StatefulWidget {
  String topic;
  String value;
  String difficulty;
  QuizStart({
    super.key,
    required this.topic,
    required this.value,
    required this.difficulty,
  });

  @override
  State<QuizStart> createState() => _QuizStartState();
}

class _QuizStartState extends State<QuizStart> {
  String? question;
  String? my_answer;
  String? gemini_ans;
  int total_questions = 0;
  bool islistening = false;
  SpeechToText stt = SpeechToText();
  int total_time = 30;
  bool isquiz_ended = false;

  Future<void> get_question_from_gemini() async {
    String ans = await gemini_api.getgeminidata(
        'Just ask me a single theory question or quiz question on ${widget.topic} for interview preparation without answer of ${widget.difficulty} difficulty level');
    setState(() {
      question = ans.replaceAll('*', '');
    });
  }
  //asking the question to user

  Future ask_question() async {
    await get_question_from_gemini();
    await speak(question);
  }

  //answer checking of user
  Future<void> check_answer() async {
    String ans = await gemini_api.getgeminidata(
        '$question and my answer to the question is $my_answer. Rate my answer and my communication skills out of 10 suggest me some required improvements in my answer in short and precise words .');
    setState(() {
      gemini_ans = ans.replaceAll("*", " ");
    });
  }

  //passng into the quiz flow
  Future validate_answer() async {
    await check_answer();
    await speak(gemini_ans);
    setState(() {
      gemini_ans = "";
    });
  }

  // start flow of the quiz
  Future startQuiz() async {
    for (int i = 0; i < total_questions; i++) {
      //asking the qestion to user
      await ask_question();
      setState(() {
        total_time = 30;
      });

      //waiting for 30 seconds to give answer to user
      start_contdown();
      await Future.delayed(Duration(seconds: 30));

      //checking of answer;
      await validate_answer();
      setState(() {
        gemini_ans = "";
      });
    }
    setState(() {
      isquiz_ended = true;
    });
  }

  Future speak_intro() async {
    await speak(
        "Hello $name, I am Arya your A.I. assistant for learning about new things  , I love to helping you on learning ${widget.topic} ,  so let's start , you have 30 seconds to answer every question, so get ready, the questions on ${widget.topic} are");
  }

  String? name;

  Future get_name() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      name = pref.getString('name')!;
    });
  }

  @override
  void initState() {
    super.initState();
    get_name();
    Future.delayed(Duration(seconds: 2), () {
      speak_intro();
    });
    setState(() {
      total_questions = int.parse(widget.value.toString());
    });
    Future.delayed(Duration(seconds: 14), () {
      startQuiz();
    });
  }

  void start_contdown() {
    Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        if (total_time > 0) {
          setState(() {
            total_time--;
          });
        } else {
          timer.cancel();
        }
      },
    );
  }

  final my_style = TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: GestureDetector(
          onTap: () async {
            if (!islistening) {
              var available = await stt.initialize();
              if (available) {
                setState(() {
                  islistening = true;
                  stt.listen(
                    onResult: (result) {
                      setState(() {
                        my_answer = result.recognizedWords;
                        print(my_answer);
                      });
                    },
                  );
                });
              }
            } else {
              setState(() {
                islistening = false;
                stt.stop();
              });
            }
          },
          child: CircleAvatar(
            radius: 40,
            backgroundColor: Colors.grey[100],
            child: islistening == true
                ? Icon(
                    Icons.pause,
                    color: Colors.black87,
                    size: 30,
                  )
                : Icon(
                    Icons.mic,
                    color: Colors.black87,
                    size: 30,
                  ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomRight,
                    colors: [
                  Colors.green[100]!,
                  Colors.green[200]!,
                  Colors.green[300]!,
                  Colors.green[400]!,
                  Colors.green[500]!,
                ])),
            child: Padding(
                padding:
                    EdgeInsets.only(left: 13, right: 13, top: 40, bottom: 60),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.grey[400],
                            border: Border.all(
                                color: Colors.black87,
                                width: 2,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Center(
                            child: Text(
                              total_time.toString(),
                              style: TextStyle(
                                  fontSize: 29, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      question != " " && question != null
                          ? Card(
                              shadowColor: Colors.grey,
                              borderOnForeground: true,
                              color: Colors.white,
                              elevation: 5,
                              margin: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 5),
                              child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Text(
                                    question!,
                                    style: my_style,
                                  )))
                          : Container(),
                      gemini_ans != "" && gemini_ans != null
                          ? Card(
                              shadowColor: Colors.grey,
                              borderOnForeground: true,
                              color: Colors.white,
                              elevation: 5,
                              margin: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 5),
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Text(
                                  gemini_ans!,
                                  style: my_style,
                                ),
                              ),
                            )
                          : Lottie.network(
                              'https://lottie.host/6cdd6128-2770-4cd5-bb5b-f04848689f8d/y03HYaytvF.json',
                              width: double.infinity,
                              height: 400),
                      isquiz_ended == true
                          ? my_button(
                              text: 'END QUIZ',
                              ontap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //       builder: (context) => QuizGenerator(),
                                //     ));
                                Navigator.pop(context);
                              })
                          : Container()
                    ],
                  ),
                ))));
  }
}
