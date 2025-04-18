// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';

class AtsDetails extends StatefulWidget {
  String gemini_response;
  AtsDetails({
    super.key,
    required this.gemini_response,
  });

  @override
  State<AtsDetails> createState() => _AtsDetailsState();
}

class _AtsDetailsState extends State<AtsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 50),
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
              ],
            ),
          ),
          child: Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Card(
                    shadowColor: Colors.grey,
                    borderOnForeground: true,
                    color: Colors.white,
                    elevation: 5,
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        widget.gemini_response.replaceAll("*", ""),
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
