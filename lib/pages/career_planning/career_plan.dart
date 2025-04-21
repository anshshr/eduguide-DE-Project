import 'package:eduguide/pages/career_planning/careers_show.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CareerPlan extends StatefulWidget {
  const CareerPlan({super.key});

  @override
  State<CareerPlan> createState() => _CareerPlanState();
}

class _CareerPlanState extends State<CareerPlan> {
  List courses = [];

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
        padding: EdgeInsets.only(top: 55, left: 23, right: 23, bottom: 25),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
               Colors.blue.shade900,
              Colors.blue.shade600,
              Colors.blue.shade900,
              Colors.blue.shade600,
              Colors.blue.shade900,
              Colors.blue.shade600,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Career Plan',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: courses.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) =>
                                  CareersShow(carrer_topic: courses[index]),
                        ),
                      );
                    },
                    child: Card(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      shadowColor: Colors.grey,
                      borderOnForeground: true,
                      color: Colors.white,
                      elevation: 10,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 40,
                          ),
                          child: Text(
                            courses[index],
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
