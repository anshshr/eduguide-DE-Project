// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable

import 'package:flutter/material.dart';

class ResumeAlingment extends StatefulWidget {
  String gemini_ans;
  ResumeAlingment({
    super.key,
    required this.gemini_ans,
  });

  @override
  State<ResumeAlingment> createState() => _ResumeAlingmentState();
}

class _ResumeAlingmentState extends State<ResumeAlingment> {
  @override
  void initState() {
    super.initState();
    setState(() {
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.only(top: 50, left: 15, right: 15,bottom: 50),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                Colors.indigo[100]!,
                Colors.indigo[200]!,
                Colors.indigo[300]!,
                Colors.indigo[400]!,
                Colors.indigo[500]!,
              ])),
          child: SingleChildScrollView(
            child: Card(
                shadowColor: Colors.grey,
                borderOnForeground: true,
                color: Colors.white,
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    widget.gemini_ans.replaceAll("*", ""),
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87),
                  ),
                )),
          )),
    );
  }
}
