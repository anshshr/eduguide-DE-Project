import 'package:eduguide/services/youtube_video_transcript.dart';
import 'package:eduguide/gemini/gemini_services.dart';
import 'package:flutter/material.dart';

class VideoQuiz extends StatefulWidget {
  final String videoid;
  VideoQuiz({super.key, required this.videoid});

  @override
  State<VideoQuiz> createState() => _VideoQuizState();
}

class _VideoQuizState extends State<VideoQuiz> {
  String questions = '';
  bool isloaded = false;

  Future video_transcript() async {
    String video_transcript = await get_video_transcript(widget.videoid);
    await get_quiz_from_transcript(video_transcript);
    setState(() {
      isloaded = true;
    });

    print(widget.videoid);
    print(video_transcript);
  }

  Future get_quiz_from_transcript(String transcript) async {
    String gemini_ans = await gemini_api.getgeminidata(
      '${transcript} form a quiz of these topic for around 20 to 30 questions containing only mcqs questions which i can practice only include necessary details and containsansers at the bottom',
    );

    setState(() {
      questions = gemini_ans;
    });
    print(questions);
  }

  @override
  void initState() {
    super.initState();
    video_transcript();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.only(
          top: 60,
          left: 10,
          right: 10,
          bottom: 10,
        ),
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
            ],
          ),
        ),
        child:
            isloaded == true
                ? SingleChildScrollView(
                  child: Column(
                    children: [
                      const Text(
                        '👉  Video Summary  👈',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Card(
                        margin: const EdgeInsets.symmetric(horizontal: 6),
                        shadowColor: Colors.grey,
                        borderOnForeground: true,
                        color: Colors.white,
                        elevation: 10,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                            vertical: 20,
                          ),
                          child: Text(
                            questions.replaceAll('*', ""),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
                : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(color: Colors.black87),
                      SizedBox(height: 10),
                      Text(
                        'Loading..',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ),
      ),
    );
  }
}
