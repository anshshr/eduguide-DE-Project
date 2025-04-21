// ignore_for_file: prefer_const_literals_to_create_immutables, unnecessary_import, use_build_context_synchronously, prefer_const_constructors

import 'dart:async';

import 'package:eduguide/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/getwidget.dart';

import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/my_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? name = "";
  @override
  void initState() {
    super.initState();
    set_prefernce();
  }

  Future<void> set_prefernce() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      name = pref.getString('name');
    });
  }

  bool flag1 = false;
  bool flag2 = false;
  bool flag3 = false;
  bool flag4 = false;
  bool flag5 = false;
  bool flag6 = false;
  bool flag7 = false;
  bool flag8 = false;
  bool flag9 = false;
  bool flag10 = false;
  bool flag11 = false;
  bool flag12 = false;
  bool flag13 = false;
  bool flag14 = false;
  bool flag15 = false;
  bool flag16 = false;
  bool flag17 = false;
  bool flag18 = false;
  bool flagSports = false;
  bool flagPublicSpeaking = false;
  bool flagDancing = false;
  bool flagMusic = false;
  bool flagArt = false;
  bool flagPhotography = false;
  bool flagCooking = false;

  GFColors? color;

  Map<String, dynamic> getTrueFlagsInfo() {
    List<Map<String, dynamic>> flags = [
      {"label": "PYTHON", "value": flag1},
      {"label": "DJANGO", "value": flag2},
      {"label": "C++", "value": flag3},
      {"label": "JAVA", "value": flag4},
      {"label": "MONGO DB", "value": flag5},
      {"label": "FLASK", "value": flag6},
      {"label": "FLUTTER", "value": flag7},
      {"label": "KOTLIN", "value": flag8},
      {"label": "RUBY", "value": flag9},
      {"label": "GOLANG", "value": flag10},
      {"label": "REACT", "value": flag11},
      {"label": "MICRO SERVICES", "value": flag12},
      {"label": "AI AND ML", "value": flag13},
      {"label": "EXPRESS", "value": flag14},
      {"label": "NODEJS", "value": flag15},
      {"label": "MERN", "value": flag16},
      {"label": "ANGULAR", "value": flag17},
      {"label": "NEXTJS", "value": flag18},
      {"label": "SPORTS", "value": flagSports},
      {"label": "PUBLIC SPEAKING", "value": flagPublicSpeaking},
      {"label": "DANCING", "value": flagDancing},
      {"label": "MUSIC", "value": flagMusic},
      {"label": "ART", "value": flagArt},
      {"label": "PHOTOGRAPHY", "value": flagPhotography},
      {"label": "COOKING", "value": flagCooking},
    ];

    List<String> trueLabels = [];
    int trueCount = 0;

    for (var flag in flags) {
      if (flag["value"] == true) {
        trueLabels.add(flag["label"]);
        trueCount++;
      }
    }

    return {"count": trueCount, "labels": trueLabels};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
      body: Align(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.lightBlue[100]!,
                Colors.blue[200]!,
                Colors.blue[300]!,
                Colors.red[100]!,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 30),
          alignment: Alignment.centerLeft,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, top: 40),
                  child: Text(
                    'Hello , $name',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[700],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Choose what Suits best fit for you !!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey[600],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.67,
                width: MediaQuery.of(context).size.width,
                child: GridView.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 20,
                  children: [
                    GFButton(
                      onPressed: () {
                        setState(() {
                          flag1 = !flag1;
                        });
                      },
                      text: 'PYTHON',
                      type: GFButtonType.solid,
                      shape: GFButtonShape.pills,
                      borderSide: BorderSide(color: Colors.black, width: 1),
                      size: GFSize.LARGE,
                      color:
                          flag1 == true
                              ? const Color.fromARGB(255, 171, 212, 188)
                              : GFColors.TRANSPARENT,
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: flag1 == true ? Colors.white : Colors.black,
                      ),
                    ),
                    GFButton(
                      onPressed: () {
                        setState(() {
                          flag2 = !flag2;
                        });
                      },
                      text: 'DJANGO',
                      type: GFButtonType.solid,
                      shape: GFButtonShape.pills,
                      borderSide: BorderSide(color: Colors.black, width: 1),
                      size: GFSize.LARGE,
                      color:
                          flag2 == true
                              ? const Color.fromARGB(255, 171, 212, 188)
                              : GFColors.TRANSPARENT,
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: flag2 == true ? Colors.white : Colors.black,
                      ),
                    ),
                    GFButton(
                      onPressed: () {
                        setState(() {
                          flag3 = !flag3;
                        });
                      },
                      text: 'C++',
                      type: GFButtonType.solid,
                      shape: GFButtonShape.pills,
                      borderSide: BorderSide(color: Colors.black, width: 1),
                      size: GFSize.LARGE,
                      color:
                          flag3 == true
                              ? const Color.fromARGB(255, 171, 212, 188)
                              : GFColors.TRANSPARENT,
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: flag3 == true ? Colors.white : Colors.black,
                      ),
                    ),
                    GFButton(
                      onPressed: () {
                        setState(() {
                          flag4 = !flag4;
                        });
                      },
                      text: 'JAVA',
                      type: GFButtonType.solid,
                      shape: GFButtonShape.pills,
                      borderSide: BorderSide(color: Colors.black, width: 1),
                      size: GFSize.LARGE,
                      color:
                          flag4 == true
                              ? const Color.fromARGB(255, 171, 212, 188)
                              : GFColors.TRANSPARENT,
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: flag4 == true ? Colors.white : Colors.black,
                      ),
                    ),
                    GFButton(
                      onPressed: () {
                        setState(() {
                          flag5 = !flag5;
                        });
                      },
                      text: 'MONGO DB',
                      type: GFButtonType.solid,
                      shape: GFButtonShape.pills,
                      borderSide: BorderSide(color: Colors.black, width: 1),
                      size: GFSize.LARGE,
                      color:
                          flag5 == true
                              ? const Color.fromARGB(255, 171, 212, 188)
                              : GFColors.TRANSPARENT,
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: flag5 == true ? Colors.white : Colors.black,
                      ),
                    ),
                    GFButton(
                      onPressed: () {
                        setState(() {
                          flag6 = !flag6;
                        });
                      },
                      text: 'FLASK',
                      type: GFButtonType.solid,
                      shape: GFButtonShape.pills,
                      borderSide: BorderSide(color: Colors.black, width: 1),
                      size: GFSize.LARGE,
                      color:
                          flag6 == true
                              ? const Color.fromARGB(255, 171, 212, 188)
                              : GFColors.TRANSPARENT,
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: flag6 == true ? Colors.white : Colors.black,
                      ),
                    ),
                    GFButton(
                      onPressed: () {
                        setState(() {
                          flag7 = !flag7;
                        });
                      },
                      text: 'FLUTTER',
                      type: GFButtonType.solid,
                      shape: GFButtonShape.pills,
                      borderSide: BorderSide(color: Colors.black, width: 1),
                      size: GFSize.LARGE,
                      color:
                          flag7 == true
                              ? const Color.fromARGB(255, 171, 212, 188)
                              : GFColors.TRANSPARENT,
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: flag7 == true ? Colors.white : Colors.black,
                      ),
                    ),
                    GFButton(
                      onPressed: () {
                        setState(() {
                          flag8 = !flag8;
                        });
                      },
                      text: 'KOTLIN',
                      type: GFButtonType.solid,
                      shape: GFButtonShape.pills,
                      borderSide: BorderSide(color: Colors.black, width: 1),
                      size: GFSize.LARGE,
                      color:
                          flag8 == true
                              ? const Color.fromARGB(255, 171, 212, 188)
                              : GFColors.TRANSPARENT,
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: flag8 == true ? Colors.white : Colors.black,
                      ),
                    ),
                    GFButton(
                      onPressed: () {
                        setState(() {
                          flag9 = !flag9;
                        });
                      },
                      text: 'RUBY',
                      type: GFButtonType.solid,
                      shape: GFButtonShape.pills,
                      borderSide: BorderSide(color: Colors.black, width: 1),
                      size: GFSize.LARGE,
                      color:
                          flag9 == true
                              ? const Color.fromARGB(255, 171, 212, 188)
                              : GFColors.TRANSPARENT,
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: flag9 == true ? Colors.white : Colors.black,
                      ),
                    ),
                    GFButton(
                      onPressed: () {
                        setState(() {
                          flag10 = !flag10;
                        });
                      },
                      text: 'GOLANG',
                      type: GFButtonType.solid,
                      shape: GFButtonShape.pills,
                      borderSide: BorderSide(color: Colors.black, width: 1),
                      size: GFSize.LARGE,
                      color:
                          flag10 == true
                              ? const Color.fromARGB(255, 171, 212, 188)
                              : GFColors.TRANSPARENT,
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: flag10 == true ? Colors.white : Colors.black,
                      ),
                    ),
                    GFButton(
                      onPressed: () {
                        setState(() {
                          flag11 = !flag11;
                        });
                      },
                      text: 'REACT',
                      type: GFButtonType.solid,
                      shape: GFButtonShape.pills,
                      borderSide: BorderSide(color: Colors.black, width: 1),
                      size: GFSize.LARGE,
                      color:
                          flag11 == true
                              ? const Color.fromARGB(255, 171, 212, 188)
                              : GFColors.TRANSPARENT,
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: flag11 == true ? Colors.white : Colors.black,
                      ),
                    ),
                    GFButton(
                      onPressed: () {
                        setState(() {
                          flag12 = !flag12;
                        });
                      },
                      text: 'MICRO SERVICES',
                      type: GFButtonType.solid,
                      shape: GFButtonShape.pills,
                      borderSide: BorderSide(color: Colors.black, width: 1),
                      size: GFSize.LARGE,
                      color:
                          flag12 == true
                              ? const Color.fromARGB(255, 171, 212, 188)
                              : GFColors.TRANSPARENT,
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: flag12 == true ? Colors.white : Colors.black,
                      ),
                    ),
                    GFButton(
                      onPressed: () {
                        setState(() {
                          flag13 = !flag13;
                        });
                      },
                      text: 'AI AND ML',
                      type: GFButtonType.solid,
                      shape: GFButtonShape.pills,
                      borderSide: BorderSide(color: Colors.black, width: 1),
                      size: GFSize.LARGE,
                      color:
                          flag13 == true
                              ? const Color.fromARGB(255, 171, 212, 188)
                              : GFColors.TRANSPARENT,
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: flag13 == true ? Colors.white : Colors.black,
                      ),
                    ),
                    GFButton(
                      onPressed: () {
                        setState(() {
                          flag14 = !flag14;
                        });
                      },
                      text: 'EXPRESS',
                      type: GFButtonType.solid,
                      shape: GFButtonShape.pills,
                      borderSide: BorderSide(color: Colors.black, width: 1),
                      size: GFSize.LARGE,
                      color:
                          flag14 == true
                              ? const Color.fromARGB(255, 171, 212, 188)
                              : GFColors.TRANSPARENT,
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: flag14 == true ? Colors.white : Colors.black,
                      ),
                    ),
                    GFButton(
                      onPressed: () {
                        setState(() {
                          flag15 = !flag15;
                        });
                      },
                      text: 'NODEJS',
                      type: GFButtonType.solid,
                      shape: GFButtonShape.pills,
                      borderSide: BorderSide(color: Colors.black, width: 1),
                      size: GFSize.LARGE,
                      color:
                          flag15 == true
                              ? const Color.fromARGB(255, 171, 212, 188)
                              : GFColors.TRANSPARENT,
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: flag15 == true ? Colors.white : Colors.black,
                      ),
                    ),
                    GFButton(
                      onPressed: () {
                        setState(() {
                          flag16 = !flag16;
                        });
                      },
                      text: 'MERN',
                      type: GFButtonType.solid,
                      shape: GFButtonShape.pills,
                      borderSide: BorderSide(color: Colors.black, width: 1),
                      size: GFSize.LARGE,
                      color:
                          flag16 == true
                              ? const Color.fromARGB(255, 171, 212, 188)
                              : GFColors.TRANSPARENT,
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: flag16 == true ? Colors.white : Colors.black,
                      ),
                    ),
                    GFButton(
                      onPressed: () {
                        setState(() {
                          flag17 = !flag17;
                        });
                      },
                      text: 'ANGULAR',
                      type: GFButtonType.solid,
                      shape: GFButtonShape.pills,
                      borderSide: BorderSide(color: Colors.black, width: 1),
                      size: GFSize.LARGE,
                      color:
                          flag17 == true
                              ? const Color.fromARGB(255, 171, 212, 188)
                              : GFColors.TRANSPARENT,
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: flag17 == true ? Colors.white : Colors.black,
                      ),
                    ),
                    GFButton(
                      onPressed: () {
                        setState(() {
                          flag18 = !flag18;
                        });
                      },
                      text: 'NEXTJS',
                      type: GFButtonType.solid,
                      shape: GFButtonShape.pills,
                      borderSide: BorderSide(color: Colors.black, width: 1),
                      size: GFSize.LARGE,
                      color:
                          flag18 == true
                              ? const Color.fromARGB(255, 171, 212, 188)
                              : GFColors.TRANSPARENT,
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: flag18 == true ? Colors.white : Colors.black,
                      ),
                    ),
                    GFButton(
                      onPressed: () {
                        setState(() {
                          flagSports = !flagSports;
                        });
                      },
                      text: 'SPORTS',
                      type: GFButtonType.solid,
                      shape: GFButtonShape.pills,
                      borderSide: BorderSide(color: Colors.black, width: 1),
                      size: GFSize.LARGE,
                      color:
                          flagSports == true
                              ? const Color.fromARGB(255, 171, 212, 188)
                              : GFColors.TRANSPARENT,
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: flagSports == true ? Colors.white : Colors.black,
                      ),
                    ),
                    GFButton(
                      onPressed: () {
                        setState(() {
                          flagPublicSpeaking = !flagPublicSpeaking;
                        });
                      },
                      text: 'PUBLIC SPEAKING',
                      type: GFButtonType.solid,
                      shape: GFButtonShape.pills,
                      borderSide: BorderSide(color: Colors.black, width: 1),
                      size: GFSize.LARGE,
                      color:
                          flagPublicSpeaking == true
                              ? const Color.fromARGB(255, 171, 212, 188)
                              : GFColors.TRANSPARENT,
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color:
                            flagPublicSpeaking == true
                                ? Colors.white
                                : Colors.black,
                      ),
                    ),
                    GFButton(
                      onPressed: () {
                        setState(() {
                          flagDancing = !flagDancing;
                        });
                      },
                      text: 'DANCING',
                      type: GFButtonType.solid,
                      shape: GFButtonShape.pills,
                      borderSide: BorderSide(color: Colors.black, width: 1),
                      size: GFSize.LARGE,
                      color:
                          flagDancing == true
                              ? const Color.fromARGB(255, 171, 212, 188)
                              : GFColors.TRANSPARENT,
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color:
                            flagDancing == true ? Colors.white : Colors.black,
                      ),
                    ),
                    GFButton(
                      onPressed: () {
                        setState(() {
                          flagMusic = !flagMusic;
                        });
                      },
                      text: 'MUSIC',
                      type: GFButtonType.solid,
                      shape: GFButtonShape.pills,
                      borderSide: BorderSide(color: Colors.black, width: 1),
                      size: GFSize.LARGE,
                      color:
                          flagMusic == true
                              ? const Color.fromARGB(255, 171, 212, 188)
                              : GFColors.TRANSPARENT,
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: flagMusic == true ? Colors.white : Colors.black,
                      ),
                    ),
                    GFButton(
                      onPressed: () {
                        setState(() {
                          flagArt = !flagArt;
                        });
                      },
                      text: 'ART',
                      type: GFButtonType.solid,
                      shape: GFButtonShape.pills,
                      borderSide: BorderSide(color: Colors.black, width: 1),
                      size: GFSize.LARGE,
                      color:
                          flagArt == true
                              ? const Color.fromARGB(255, 171, 212, 188)
                              : GFColors.TRANSPARENT,
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: flagArt == true ? Colors.white : Colors.black,
                      ),
                    ),
                    GFButton(
                      onPressed: () {
                        setState(() {
                          flagPhotography = !flagPhotography;
                        });
                      },
                      text: 'PHOTOGRAPHY',
                      type: GFButtonType.solid,
                      shape: GFButtonShape.pills,
                      borderSide: BorderSide(color: Colors.black, width: 1),
                      size: GFSize.LARGE,
                      color:
                          flagPhotography == true
                              ? const Color.fromARGB(255, 171, 212, 188)
                              : GFColors.TRANSPARENT,
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color:
                            flagPhotography == true
                                ? Colors.white
                                : Colors.black,
                      ),
                    ),
                    GFButton(
                      onPressed: () {
                        setState(() {
                          flagCooking = !flagCooking;
                        });
                      },
                      text: 'COOKING',
                      type: GFButtonType.solid,
                      shape: GFButtonShape.pills,
                      borderSide: BorderSide(color: Colors.black, width: 1),
                      size: GFSize.LARGE,
                      color:
                          flagCooking == true
                              ? const Color.fromARGB(255, 171, 212, 188)
                              : GFColors.TRANSPARENT,
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color:
                            flagCooking == true ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              my_button(
                text: 'GET STARTED',
                ontap: () async {
                  Map ans = getTrueFlagsInfo();
                  SharedPreferences pref =
                      await SharedPreferences.getInstance();
                  pref.setStringList('courses selected', ans["labels"]);
                  pref.setInt('no_of_courses', ans["count"]);
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => BottomNavigation()),
                    (Route<dynamic> route) => false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
