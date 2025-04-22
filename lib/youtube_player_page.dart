// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors, camel_case_types, must_be_immutable

import 'package:eduguide/pages/courses%20pages/video_quiz.dart';
import 'package:eduguide/pages/courses%20pages/video_summary.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class youtube_player extends StatefulWidget {
  String url;
  youtube_player({
    super.key,
    required this.url,
  });

  @override
  State<youtube_player> createState() => _youtube_playerState();
}

class _youtube_playerState extends State<youtube_player> {
  late YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(widget.url)!,
        flags: YoutubePlayerFlags(
          autoPlay: true,
          hideControls: false,
          mute: false,
          controlsVisibleAtStart: true,
          loop: true,
          hideThumbnail: true,
          disableDragSeek: true,
          isLive: false,
        ));
    print(widget.url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.only(top: 60, left: 10, right: 10, bottom: 10),
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
        child: Column(
          children: [
            Text(
              'Start Learning',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(
              height: 15,
            ),
            OrientationBuilder(
              builder: (context, orientation) {
                return Align(
                  alignment: Alignment.topCenter,
                  child: AspectRatio(
                    aspectRatio:
                        orientation == Orientation.portrait ? 16 / 9 : 16 / 9,
                    child: YoutubePlayer(
                      controller: controller,
                      progressIndicatorColor: Colors.black87,
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 13.0),
                child: Text(
                  '👉🏾 Once you are done with the video try this : - ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),

            //get video summary button
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VideoSummary(
                          videoid: YoutubePlayer.convertUrlToId(widget.url)!),
                    ));
              },
              child: Card(
                shadowColor: Colors.grey,
                borderOnForeground: true,
                color: Colors.white,
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20),
                  child: Text(
                    ' 📸  Get Video Summary',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),

            // //get video quiz button
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => VideoQuiz(
                              videoid:
                                  YoutubePlayer.convertUrlToId(widget.url)!,
                            )));
              },
              child: Card(
                shadowColor: Colors.grey,
                borderOnForeground: true,
                color: Colors.white,
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 45.0, vertical: 20),
                  child: Text(
                    '🧾  Generate Quiz',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
