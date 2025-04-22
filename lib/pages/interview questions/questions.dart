// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors, must_be_immutable
import 'package:eduguide/gemini/gemini_services.dart';
import 'package:eduguide/services/create_pdf.dart';
import 'package:eduguide/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Questions extends StatefulWidget {
  String topic;
  Questions({Key? key, required this.topic}) : super(key: key);

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  String result = "";
  @override
  void initState() {
    super.initState();
    get_gemini_que_ans();
  }

  bool isloaded = false;

  Future get_gemini_que_ans() async {
    String gemini_ans = await gemini_api.getgeminidata(
      'can you give me the top 10 interview questions with detailed answers of ${widget.topic} in proper format that i can prepare',
    );
    setState(() {
      result = gemini_ans;
    });
    setState(() {
      isloaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.only(bottom: 14, top: 40),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.amber[100]!,
              Colors.amber[200]!,
              Colors.amber[300]!,
              Colors.amber[200]!,
              Colors.amber[100]!,
            ],
          ),
        ),
        child:
            isloaded == true
                ? SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        'Top 10 interview questions of ${widget.topic}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Card(
                        margin: EdgeInsets.only(
                          top: 20,
                          bottom: 20,
                          left: 20,
                          right: 20,
                        ),
                        shadowColor: Colors.grey,
                        borderOnForeground: true,
                        color: Colors.white,
                        elevation: 10,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            result.replaceAll('*', ""),
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 15.5,
                            ),
                          ),
                        ),
                      ),

                      my_button(
                        text: 'Generate PDF',
                        ontap: () {
                          createPDF(result.replaceAll('*', ""), widget.topic);
                        },
                      ),
                    ],
                  ),
                )
                : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.network(
                        'https://lottie.host/389e52c5-17cb-4a11-8148-6305f3f361df/qCe8U8m2Tg.json',
                        height: 300,
                        width: 300,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'LOOKING FOR MATERIAL',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17.5,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
      ),
    );
  }
}
