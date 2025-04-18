// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names, use_super_parameters, must_be_immutable
// ignore_for_file: prefer_const_constructors

// to show the complete job details of any job at the start page and also have acces to apply at the job as well

import 'package:flutter/material.dart';

class JobsDetails extends StatelessWidget {
  String title;
  String company_name;
  String location;
  String thumbnail_url;
  String description;

  JobsDetails({
    Key? key,
    required this.title,
    required this.company_name,
    required this.location,
    required this.thumbnail_url,
    required this.description,
  }) : super(key: key);
  final TextStyle heading_style =
      TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  final TextStyle other_style =
      TextStyle(fontSize: 15, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.only(top: 40, left: 10, right: 10, bottom: 10),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                Colors.indigo[100]!,
                Colors.indigo[200]!,
                Colors.indigo[300]!,
                Colors.indigo[300]!,
                Colors.indigo[200]!,
              ])),
          child: Padding(
            padding: EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 10),
            child: SingleChildScrollView(
              child: Card(
                shadowColor: Colors.grey,
                borderOnForeground: true,
                color: Colors.white,
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 20, left: 20),
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 1,
                                  )),
                              //thumbnail of the company
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  thumbnail_url,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            //name of the comapny
                            Text(
                              company_name,
                              style: heading_style,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        location,
                        style: heading_style,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        title,
                        style: other_style,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        description,
                        style: other_style,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
