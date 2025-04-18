// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names

import 'package:eduguide/extra_operations/youtube_video_transcript.dart';
import 'package:eduguide/gemini/gemini_services.dart';
import 'package:flutter/material.dart';

class VideoSummary extends StatefulWidget {
  final String videoid;
  const VideoSummary({
    super.key,
    required this.videoid,
  });

  @override
  State<VideoSummary> createState() => _VideoSummaryState();
}

class _VideoSummaryState extends State<VideoSummary> {
  bool isloaded = false;
  String transcript_summary = '';

  Future video_transcript() async {
    String video_transcript = await get_video_transcript(widget.videoid);
    await get_summary_from_transcript(video_transcript);
    setState(() {
      isloaded = true;
    });
  }

  Future get_summary_from_transcript(String transcript) async {
    String gemini_ans = await gemini_api.getgeminidata(
        '${transcript}summarize it and also add your own points about the topic to make the user clearly understand the topic');
    setState(() {
      transcript_summary = gemini_ans;
    });
    print(transcript_summary);
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
        padding:
            const EdgeInsets.only(top: 50, left: 10, right: 10, bottom: 20),
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
            borderRadius: BorderRadius.circular(20)),
        child: isloaded == true
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    const Text(
                      '👉  Video Summary  👈',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Card(
                        margin: const EdgeInsets.symmetric(horizontal: 6),
                        shadowColor: Colors.grey,
                        borderOnForeground: true,
                        color: Colors.white,
                        elevation: 10,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 20),
                          child: Text(
                            transcript_summary.replaceAll('*', " "),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                        ))
                  ],
                ),
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      color: Colors.black87,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Loading..',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
