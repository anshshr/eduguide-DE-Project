// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

import 'package:lottie/lottie.dart';
import '../../gemini/gemini_services.dart';
import '../../extra_operations/text_extraction.dart';
import '../../my widgets/my_button.dart';
import 'resume_alingment.dart';

class ResumeReview extends StatefulWidget {
  const ResumeReview({super.key});

  @override
  State<ResumeReview> createState() => _ResumeReviewState();
}

class _ResumeReviewState extends State<ResumeReview> {
  final my_style = TextStyle(
      fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black87);
  TextEditingController job_desc = TextEditingController();
  File? file;
  String? extracted_text;
  RxString result = "".obs;
  Future pick_file() async {
    final picked_file = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: false,
      allowedExtensions: ['pdf'],
    );

    if (picked_file == null) return;

    final path = picked_file.files.single.path;
    if (path == null) return;
    setState(() {
      file = File(path);
    });

    String text = extract_text(file!);
    setState(() {
      extracted_text = text;
    });
  }

  Future<void> getGeminiResult() async {
    String ans = await gemini_api.getgeminidata(
        'this is my resume $extracted_text and this is the job role for which i am applying and tell me whether my resume aligns with this job role or not ${job_desc.text} in a precise manner');
    setState(() {
      result.value = ans;
    });
  }

  Future<void> showSplashAndNavigate() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.network(
                'https://lottie.host/9f3409a9-8882-4ce1-b7e6-b3affa7efd6d/C4A1wX9PQp.json',
                height: 300,
                width: 300),
            SizedBox(
              height: 20,
            ),
            Text(
              'CALCULATING RESULTS',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.white70),
            )
          ],
        ));
      },
    );

    await Future.delayed(Duration(seconds: 6));

    Navigator.of(context).pop(); // close the dialog
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResumeAlingment(
            gemini_ans: result.value,
          ),
        )).then((_) {
      setState(() {
        job_desc.text = "";
        file = null;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.only(top: 50, left: 25, right: 25),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
              Colors.indigo[100]!,
              Colors.indigo[200]!,
              Colors.indigo[200]!,
              Colors.indigo[200]!,
              Colors.indigo[100]!,
            ])),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //welcome text and usage details
              Text(
                'HELLO BUDDY  🤝',
                style: my_style,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Let's see , 😎 😎 whether your resume best fits for the job role you want ??",
                style: my_style,
              ),

              Lottie.network(
                  'https://lottie.host/88ca1ed1-13da-40d6-ae8d-553ef71cca35/dabemQfHTg.json',
                  width: double.infinity,
                  height: 250),

              //textfield for giving job description
              Card(
                shadowColor: Colors.grey,
                borderOnForeground: true,
                color: Colors.white,
                elevation: 5,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: TextField(
                  maxLines: 10,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    hintText: 'Enter your job description',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black87),borderRadius: BorderRadius.circular(13)),
                  ),
                  controller: job_desc,
                ),
              ),
              //button for uploading resume

              file == null
                  ? my_button(
                      text: 'SHARE YOUR RESUME',
                      ontap: () async {
                        await pick_file();
                      })
                  : my_button(
                      text: 'COMPARE ROLE ',
                      ontap: () async {
                        showSplashAndNavigate();
                        await getGeminiResult();

                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => ResumeAlingment(
                        //         gemini_ans: result.value,
                        //       ),
                        //     ));
                        // setState(() {
                        //   job_desc.text = "";
                        //   file = null;
                        // });
                      })
            ],
          ),
        ),
      ),
    );
  }
}
