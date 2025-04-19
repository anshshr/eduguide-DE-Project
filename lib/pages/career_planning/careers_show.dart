import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CareersShow extends StatefulWidget {
  final String carrer_topic;

  CareersShow({super.key, required this.carrer_topic});

  @override
  State<CareersShow> createState() => _CareersShowState();
}

class _CareersShowState extends State<CareersShow> {
  String? imageUrl;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchPlantUMLImage();
  }

  Future<void> fetchPlantUMLImage() async {
    final url = Uri.parse(
      'https://plantuml-diagram-generator.onrender.com/generate-plantuml',
    );
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'topicName': widget.carrer_topic}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        imageUrl = data['url'];
        isLoading = false;
      });
    } else {
      setState(() {
        imageUrl = null;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
          isLoading
              ? Center(child: CircularProgressIndicator(color: Colors.black))
              : imageUrl != null
              ? Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'Visualization for "${widget.carrer_topic}"',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                            imageUrl!,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) {
                              return Center(
                                child: Text(
                                  'Failed to load image',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 16,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
              : Center(
                child: Text(
                  'Failed to fetch data',
                  style: TextStyle(fontSize: 18, color: Colors.red),
                ),
              ),
    );
  }
}
