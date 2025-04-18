// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable, non_constant_identifier_names, unused_local_variable
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../extra_operations/youtube_api.dart';
import 'youtube_player_page.dart';

class DisplayPage extends StatefulWidget {
  String course_name;
  DisplayPage({super.key, required this.course_name});

  @override
  State<DisplayPage> createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {
  List<dynamic> data = [];
  bool isloaded = false;
  Future<void> get_youtube_data() async {
    List<dynamic> youtube_data = await fetchYouTubeSearchResults(
      widget.course_name +
          'one shot pogramming courses in english language only and less than 15-20 min  ',
    );
    setState(() {
      data.addAll(youtube_data);
      isloaded = true;
    });
    print(data);
  }

  Future fetch_data() async {
    await get_youtube_data();
  }

  @override
  void initState() {
    super.initState();
    fetch_data();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.only(top: 50, left: 23, right: 23, bottom: 25),
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
                ? Column(
                  children: [
                    Text(
                      'Top Courses',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return Card(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            shadowColor: Colors.grey,
                            borderOnForeground: true,
                            color: Colors.white,
                            elevation: 5,
                            child: Column(
                              children: [
                                SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  child: Text(
                                    data[index]['title'] ?? 'No title',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (context) => youtube_player(
                                              url: data[index]['link'] ?? '',
                                            ),
                                      ),
                                    );
                                  },
                                  child: Image.network(
                                    '${data[index]['thumbnail']['static']} ?? ${data[index]['thumbnail']['rich']}',
                                  ),
                                ),
                                SizedBox(height: 20),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                )
                : Center(
                  child: CircularProgressIndicator(color: Colors.black87),
                ),
      ),
    );
  }
}
