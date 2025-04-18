import 'package:eduguide/pages/interview%20questions/questions.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InterviewQue extends StatefulWidget {
  const InterviewQue({super.key});

  @override
  State<InterviewQue> createState() => _InterviewQueState();
}

class _InterviewQueState extends State<InterviewQue> {
  List courses = [];
  String ans = "";

  Future get_courses_data() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      courses = pref.getStringList('courses selected') ?? [];
    });
    print(courses);
  }

  @override
  void initState() {
    super.initState();
    get_courses_data();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 15)
              .copyWith(top: 35, bottom: 20),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Colors.greenAccent[100]!,
                Colors.greenAccent[200]!,
                Colors.greenAccent[200]!,
                Colors.greenAccent[400]!,
                Colors.greenAccent[200]!,
              ])),
          child: Column(
            children: <Widget>[
              const Text(
                'Get Prepared for your Intervierws',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: courses.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      child: Card(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        shadowColor: Colors.grey,
                        borderOnForeground: true,
                        color: Colors.white,
                        elevation: 10,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 40),
                            child: Text(
                              courses[index],
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87),
                            ),
                          ),
                        ),
                      ),
                      onTap: () async {
                        

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Questions(topic: courses[index],),
                            ));
                      },
                    );
                  },
                ),
              )
            ],
          )),
    );
  }
}
