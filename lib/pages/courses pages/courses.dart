// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, non_constant_identifier_names

import 'package:eduguide/pages/courses%20pages/display_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Courses extends StatefulWidget {
  const Courses({super.key});

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  List courses = [];
  bool is_search = false;
  TextEditingController search = TextEditingController();

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
      //search icon for custom search
      floatingActionButton: GestureDetector(
        onTap: () {
          setState(() {
            is_search = !is_search;
          });
        },
        child: CircleAvatar(
            radius: 40,
            backgroundColor: Colors.grey[100],
            child: Icon(
              Icons.search_rounded,
              color: Colors.black87,
              size: 50,
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.only(top: 55, left: 23, right: 23, bottom: 25),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                Colors.blueGrey[100]!,
                Colors.blueGrey[200]!,
                Colors.blueGrey[300]!,
                Colors.blueGrey[200]!,
                Colors.blueGrey[100]!,
              ])),
          child: Column(
            children: [
              is_search == false
                  ? Text(
                      'Your personalised courses are displayed here , keep learning and keep exploring 😄😄',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        textInputAction: TextInputAction.done,
                        onSubmitted: (value) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DisplayPage(course_name: search.text),
                              ));
                        },
                        controller: search,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            hintText: 'Enter your search here',
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.black87),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black87, width: 2),
                                borderRadius: BorderRadius.circular(20),
                                gapPadding: 20),
                            errorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black87, width: 2),
                                borderRadius: BorderRadius.circular(20),
                                gapPadding: 20),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black87, width: 2),
                                borderRadius: BorderRadius.circular(20),
                                gapPadding: 20),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black87, width: 2),
                                borderRadius: BorderRadius.circular(20),
                                gapPadding: 20),
                            disabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black87, width: 2),
                                borderRadius: BorderRadius.circular(20),
                                gapPadding: 20),
                            suffixIcon: Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 25,
                            )),
                      ),
                    ),
              Expanded(
                child: ListView.builder(
                  itemCount: courses.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DisplayPage(
                                course_name: courses[index],
                              ),
                            ));
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
                    );
                  },
                ),
              ),
            ],
          )),
    );
  }
}
