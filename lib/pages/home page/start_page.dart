// ignore_for_file: prefer_if_null_operators, non_constant_identifier_names, prefer_const_constructors, prefer_interpolation_to_compose_strings, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'dart:io';
import 'package:eduguide/pages/langChain_chat_service/pages/record_audio.dart';
import 'package:eduguide/widgets/my_container.dart';
import 'package:eduguide/pages/ATS%20score%20calculator/ats.dart';
import 'package:eduguide/pages/career_planning/career_plan.dart';
import 'package:eduguide/pages/courses%20pages/courses.dart';
import 'package:eduguide/pages/home%20page/jobs_list.dart';
import 'package:eduguide/pages/interview%20questions/interview_que.dart';
import 'package:eduguide/pages/quiz%20app/quiz_generator.dart';
import 'package:eduguide/pages/resume%20review/resume_review.dart';
import 'package:eduguide/pages/video_call_feature/experts_list.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:carousel_slider/carousel_slider.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  String? name;
  File? file;
  List courses = [];

  @override
  void initState() {
    super.initState();
    get_total_details();
  }

  Future get_total_details() async {
    await get_details();
  }

  Future get_details() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      name = pref.getString('name') == null ? 'user' : pref.getString('name');
      String? filePath = pref.getString('profile_picture');
      if (filePath != null && filePath.isNotEmpty) {
        file = File(filePath);
      }
    });
    setState(() {});
    courses = pref.getStringList('courses selected') ?? [];
    print(courses);
  }

  List<Widget> images = [
    //ats calculator
    my_container(
      url:
          'https://i.pinimg.com/236x/55/dd/eb/55ddebad50b46227096f859ac67d4abe.jpg',
      title_text: 'ATS CALCULATOR',
      desc_text:
          'Our app includes an Applicant Tracking System (ATS) core analysis tool.',
      base_icon: Icon(
        Icons.calculate_outlined,
        size: 80,
        color: Colors.black87,
      ),
    ),

    //resume review
    my_container(
      url:
          'https://i.pinimg.com/236x/9a/3a/4d/9a3a4dba26def32fdadc2479ec9e3379.jpg',
      title_text: 'EXPERT RESUME REVIEW',
      desc_text:
          'This feature allows users to compare their resumes against specific job descriptions.',
      base_icon: Icon(
        Icons.document_scanner_outlined,
        size: 70,
        color: Colors.black87,
      ),
    ),

    //ai assistant arya
    my_container(
      url:
          'https://i.pinimg.com/236x/27/46/cd/2746cda302b837f8089ed1285970893d.jpg',
      title_text: 'ARYA (A.I. ASSISTANT)',
      desc_text:
          " Arya can suggest topics, provide hints, and offer feedback based on the user's performance.",
      base_icon: Icon(Icons.person_3, size: 80, color: Colors.black87),
    ),

    //courses
    my_container(
      url:
          'https://i.pinimg.com/236x/98/d5/17/98d5177ca7b53c4e3db1205615d9c33c.jpg',
      title_text: 'COURSES',
      desc_text:
          'Our app includes a courses section where users can access a variety of courses on different topics.',
      base_icon: Icon(Icons.description, size: 80, color: Colors.black87),
    ),
    //quizzes
    my_container(
      url:
          'https://i.pinimg.com/236x/5d/28/0d/5d280d69167bafda2da00c54e1a4473e.jpg',
      title_text: 'TECH QUIZZES',
      desc_text:
          'Our app offers a comprehensive quiz section where users can take quizzes on various topics to prepare for interviews.',
      base_icon: Icon(Icons.quiz_rounded, size: 80, color: Colors.black87),
    ),
    //interview preparation
    my_container(
      url:
          'https://i.pinimg.com/236x/98/d5/17/98d5177ca7b53c4e3db1205615d9c33c.jpg',
      title_text: 'INTERVIEW PREPARATION',
      desc_text:
          'Our app offers a comprehensive where users can get latest interview questions and answers.',
      base_icon: Icon(Icons.question_answer, size: 80, color: Colors.black87),
    ),
    my_container(
      url:
          'https://i.pinimg.com/236x/98/d5/17/98d5177ca7b53c4e3db1205615d9c33c.jpg',
      title_text: 'PUBLIC SPEAKING',
      desc_text:
          'Enhance your public speaking skills with expert tips and practice.',
      base_icon: Icon(Icons.public, size: 80, color: Colors.black87),
    ),
    my_container(
      url:
          'https://i.pinimg.com/236x/98/d5/17/98d5177ca7b53c4e3db1205615d9c33c.jpg',
      title_text: 'COOKING',
      desc_text: 'Learn to cook with step-by-step recipes and video tutorials.',
      base_icon: Icon(Icons.cookie_rounded, size: 80, color: Colors.black87),
    ),
    my_container(
      url:
          'https://i.pinimg.com/236x/98/d5/17/98d5177ca7b53c4e3db1205615d9c33c.jpg',
      title_text: 'ART',
      desc_text: ' Explore your creativity with art tutorials and inspiration.',
      base_icon: Icon(Icons.art_track_sharp, size: 80, color: Colors.black87),
    ),
    my_container(
      url:
          'https://i.pinimg.com/236x/98/d5/17/98d5177ca7b53c4e3db1205615d9c33c.jpg',
      title_text: 'SPORTS',
      desc_text: 'Stay updated with the latest sports news and analysis.',
      base_icon: Icon(Icons.sports_baseball, size: 80, color: Colors.black87),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.blue[100]!,
                  Colors.blue[200]!,
                  Colors.blue[300]!,
                  Colors.blue[400]!,
                  Colors.blue,
                ],
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 60,
              ).copyWith(bottom: 0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        //circle avatar for displaying image uploaded by user
                        CircleAvatar(
                          radius: 30,
                          child: Center(
                            child:
                                file == null
                                    ? Icon(
                                      Icons.person,
                                      color: Colors.black87,
                                      size: 40,
                                    )
                                    : ClipOval(
                                      child: Align(
                                        alignment: Alignment.topCenter,
                                        child: Image.file(
                                          file!,
                                          fit: BoxFit.cover,
                                          height: 200,
                                          width: 200,
                                        ),
                                      ),
                                    ),
                          ),
                        ),
                        SizedBox(width: 15),

                        //welcome text
                        Text(
                          'Welcome  ${name?.split(' ')[0]}  😊',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),

                    //name of features  in caraousel slider
                    CarouselSlider(
                      items: images,
                      options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: true,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        autoPlayAnimationDuration: Duration(seconds: 3),
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        height: 200,
                        scrollDirection: Axis.horizontal,
                        reverse: true,
                        enlargeFactor: 1,
                        viewportFraction: 0.95,
                        animateToClosest: true,
                        disableCenter: true,
                        pauseAutoPlayOnTouch: true,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      '⭐ We have got the best things covered for you 💫',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 20),

                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        '👉🏾 JobAlert & Interview Prep ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),

                    SizedBox(height: 10),

                    Row(
                      children: [
                        //jobs section
                        InkWell(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.2,
                            width: MediaQuery.of(context).size.width * 0.471,
                            child: Card(
                              // margin: EdgeInsets.only(right: 40),
                              shadowColor: Colors.grey,
                              borderOnForeground: true,
                              color: Colors.grey[300]!,
                              elevation: 10,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 10,
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(
                                      Icons.home_work_sharp,
                                      size: 34,
                                      color: Colors.black87,
                                    ),
                                    Text(
                                      'JOB SEARCH',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Get Personalized Job Alerts',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => JobDisplayPage(),
                              ),
                            );
                          },
                        ),
                        //interview preparation section
                        InkWell(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.2,
                            width: MediaQuery.of(context).size.width * 0.471,
                            child: Card(
                              shadowColor: Colors.grey,
                              borderOnForeground: true,
                              color: Colors.grey[300]!,
                              elevation: 10,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 10,
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(
                                      Icons.question_answer,
                                      size: 34,
                                      color: Colors.black87,
                                    ),
                                    Text(
                                      'INTERVIEW PREP.',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Get preared for your Interviews',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => InterviewQue(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        '👉🏾 QuizMaster & Interview Ready ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        //courses section
                        InkWell(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.2,
                            width: MediaQuery.of(context).size.width * 0.471,
                            child: Card(
                              shadowColor: Colors.grey,
                              borderOnForeground: true,
                              color: Colors.grey[300]!,
                              elevation: 10,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 10,
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(
                                      Icons.book_rounded,
                                      size: 34,
                                      color: Colors.black87,
                                    ),
                                    Text(
                                      'COURSES',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Start with new  courses',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Courses(),
                              ),
                            );
                          },
                        ),
                        //quiz section
                        InkWell(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.2,
                            width: MediaQuery.of(context).size.width * 0.471,
                            child: Card(
                              shadowColor: Colors.grey,
                              borderOnForeground: true,
                              color: Colors.grey[300]!,
                              elevation: 10,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 10,
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(
                                      Icons.computer,
                                      size: 34,
                                      color: Colors.black87,
                                    ),
                                    Text(
                                      'Mock Interview',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Improve your skills with mock interviews',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => QuizGenerator(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),

                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        '👉🏾 ATS Optimizer & Review Hub ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        //ats score section
                        InkWell(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.2,
                            width: MediaQuery.of(context).size.width * 0.471,
                            child: Card(
                              shadowColor: Colors.grey,
                              borderOnForeground: true,
                              color: Colors.grey[300]!,
                              elevation: 10,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 10,
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(
                                      Icons.assessment,
                                      size: 34,
                                      color: Colors.black87,
                                    ),
                                    Text(
                                      'ATS SCORE',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Calculate accurate ATS score',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Ats()),
                            );
                          },
                        ),
                        //resume review section
                        InkWell(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.2,
                            width: MediaQuery.of(context).size.width * 0.471,
                            child: Card(
                              shadowColor: Colors.grey,
                              borderOnForeground: true,
                              color: Colors.grey[300]!,
                              elevation: 10,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 10,
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(
                                      Icons.rate_review_rounded,
                                      size: 34,
                                      color: Colors.black87,
                                    ),
                                    Text(
                                      'RESUME REVIEW',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Get feedback on your resume',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ResumeReview(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        '👉🏾  Plan your Career ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        InkWell(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.2,
                            width: MediaQuery.of(context).size.width * 0.471,
                            child: Card(
                              shadowColor: Colors.grey,
                              borderOnForeground: true,
                              color: Colors.grey[300]!,
                              elevation: 10,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 10,
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(
                                      Icons.person,
                                      size: 38,
                                      color: Colors.black87,
                                    ),
                                    Text(
                                      'CONNECT MENTOR',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      ' Get connected with a mentor',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            // go to mentor connect page
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RecordAudio(),
                              ),
                            );
                          },
                        ),
                        InkWell(
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.2,
                            width: MediaQuery.of(context).size.width * 0.471,
                            child: Card(
                              shadowColor: Colors.grey,
                              borderOnForeground: true,
                              color: Colors.grey[300]!,
                              elevation: 10,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 10,
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(
                                      Icons.edit_document,
                                      size: 38,
                                      color: Colors.black87,
                                    ),
                                    Text(
                                      'CAREER PLANNING',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Get a proper career planning',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            // go to  career planning page
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CareerPlan(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        InkWell(
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.2,
                            width: MediaQuery.of(context).size.width * 0.471,
                            child: Card(
                              shadowColor: Colors.grey,
                              borderOnForeground: true,
                              color: Colors.grey[300]!,
                              elevation: 10,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 10,
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(
                                      Icons.person_add_alt_1_rounded,
                                      size: 38,
                                      color: Colors.black87,
                                    ),
                                    Text(
                                      'CALL MENTOR',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Get connected with a mentor',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            // go to  career planning page
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ExpertsList(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
