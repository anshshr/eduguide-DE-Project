// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:eduguide/pages/interview%20questions/interview_que.dart';
import 'package:eduguide/pages/payments/offers_page.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

import '../pages/ATS score calculator/ats.dart';
import '../pages/courses pages/courses.dart';
import '../pages/profile page/profile.dart';
import '../pages/quiz app/quiz_generator.dart';
import '../pages/resume review/resume_review.dart';
import '../pages/settings details/settings.dart';
import '../pages/home page/start_page.dart';

class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer({super.key});

  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  List<ScreenHiddenDrawer> pages = [];
  final my_style =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white);

  @override
  void initState() {
    super.initState();
    pages = [
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: 'HOME ', baseStyle: my_style, selectedStyle: my_style),
          StartPage()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: 'COURSES', baseStyle: my_style, selectedStyle: my_style),
          Courses()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: 'QUIZESS', baseStyle: my_style, selectedStyle: my_style),
          QuizGenerator()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: 'ATS SCORE ', baseStyle: my_style, selectedStyle: my_style),
          Ats()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: 'RESUME REVIEW',
              baseStyle: my_style,
              selectedStyle: my_style),
          ResumeReview()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: 'INTERVIEW PREP',
              baseStyle: my_style,
              selectedStyle: my_style),
          InterviewQue()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: 'PROFILE', baseStyle: my_style, selectedStyle: my_style),
          Profile()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: 'PAYMENT SECTION',
              baseStyle: my_style,
              selectedStyle: my_style),
          OffersPage()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: 'SETTINGS', baseStyle: my_style, selectedStyle: my_style),
          Settings()),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      backgroundColorMenu: Colors.grey[600]!,
      screens: pages,
      initPositionSelected: 0,
      slidePercent: 60,
      verticalScalePercent: 80,
      enableCornerAnimation: true,
      contentCornerRadius: 20,
      curveAnimation: Curves.easeInOutBack,
      isTitleCentered: true,
      disableAppBarDefault: true,
    );
  }
}
