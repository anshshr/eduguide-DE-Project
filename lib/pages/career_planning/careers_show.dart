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
  String? careerPathPlan;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchCareerPathAdvice();
  }

  Future<void> fetchCareerPathAdvice() async {
    final url = Uri.parse('http://192.168.119.237:5000/career_path_advice');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'goal': widget.carrer_topic}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        careerPathPlan = data['career_path_plan'];
        isLoading = false;
      });
    } else {
      setState(() {
        careerPathPlan = 'Failed to fetch data';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          isLoading
              ? Center(child: CircularProgressIndicator(color: Colors.black))
              : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Career Path Plan for ${widget.carrer_topic}',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 16),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Text(
                              careerPathPlan!.replaceAll("*", " "),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
    );
  }
}
