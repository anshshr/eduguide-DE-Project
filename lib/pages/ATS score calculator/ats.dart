// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, non_constant_identifier_names

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

import '../../extra_operations/text_extraction.dart';
import '../../gemini/gemini_services.dart';
import '../../my widgets/my_button.dart';
import 'ats_details.dart';

class Ats extends StatefulWidget {
  const Ats({super.key});

  @override
  State<Ats> createState() => _AtsState();
}

class _AtsState extends State<Ats> with SingleTickerProviderStateMixin {
  File? file;
  String extracted_text = "";
  String gemini_ans = "";

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

  late AnimationController ani_controller;
  @override
  void initState() {
    super.initState();
    ani_controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
  }

  Future<void> getGeminiResult() async {
    String ans = await gemini_api.getgeminidata(
        'Rate my resume out of 100 for a software developer role according to the basic norms required in it and also suggest some necessary changes in pointwise manner but keep it short as well $extracted_text');
    setState(() {
      gemini_ans = ans;
    });
    print(gemini_ans);
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
                  fontSize: 16,
                  color: Colors.white70),
            )
          ],
        ));
      },
    );

    await Future.delayed(Duration(seconds: 7));

    Navigator.of(context).pop(); // close the dialog
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AtsDetails(
          gemini_response: gemini_ans.toString(),
        ),
      ),
    ).then((_) {
      setState(() {
        file = null;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
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
              ])),
          child: Padding(
            padding: EdgeInsets.only(left: 25, right: 25, top: 45),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Welcome Hustler , ',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey[700]),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    ' We are here to provide you the accurate ATS score of your Resume . ',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey[700]),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                //animation change hona chaiye according to user
                file == null
                    ? Lottie.network(
                        'https://lottie.host/45c48e66-42cd-45f3-8f85-cf676c6439d6/DDGnL350NF.json',
                        height: 250,
                        width: double.infinity,
                        fit: BoxFit.contain)
                    : Lottie.network(
                        'https://lottie.host/b4b30a5f-bb1e-4052-9431-274e9c3f341d/SxeJlnodrv.json',
                        height: 250,
                        width: double.infinity,
                        controller: ani_controller,
                        onLoaded: (composition) {
                          ani_controller
                            ..duration = composition.duration
                            ..forward();
                        },
                      ),

                SizedBox(
                  height: 20,
                ),

                //button change according to user file selection criteria
                Align(
                  alignment: Alignment.bottomCenter,
                  child: file == null
                      ? my_button(
                          text: 'SHARE YOUR RESUME',
                          ontap: () async {
                            await pick_file();
                          })
                      : my_button(
                          text: 'GET ATS SCORE',
                          ontap: () async {
                            showSplashAndNavigate();

                           await getGeminiResult();

                          }),
                ),
              ],
            ),
          )),
    );
  }
}
