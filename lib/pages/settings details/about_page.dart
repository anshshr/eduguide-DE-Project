import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  AboutPage({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ABOUT US',
          style: TextStyle(
              fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        backgroundColor: Colors.amber[100],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 30),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
              Colors.yellow[100]!,
              Colors.yellow[200]!,
              Colors.yellow[300]!,
              Colors.yellow[300]!,
              Colors.yellow[200]!,
            ])),
        child: Card(
          shadowColor: Colors.grey,
          borderOnForeground: true,
          color: Colors.white,
          elevation: 20,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'App Overview',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Our Flutter app is designed to assist users in their interview preparation through a variety of dynamic and interactive features...',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Key Features',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  featureDescription('Dynamic UI',
                      'The app features a dynamic user interface that adapts to various screen sizes and orientations, ensuring a consistent and engaging user experience across all devices.'),
                  featureDescription('ATS Core Analysis',
                      'The app includes an Applicant Tracking System (ATS) core analysis tool. Users can upload their resumes, and the app will analyze them against common ATS criteria, providing a score that highlights areas for improvement.'),
                  featureDescription('Quiz Section',
                      'The app offers a comprehensive quiz section where users can take quizzes on various topics to prepare for interviews.'),
                  featureDescription('Assistant Arya',
                      'Embedded within the quiz section, Arya is an interactive assistant that guides users through quizzes. Arya can suggest topics, provide hints, and offer feedback based on the users’ performance.'),
                  featureDescription('Resume Checker',
                      'This feature allows users to compare their resumes against specific job descriptions. The app provides detailed feedback on how well the resume matches the job requirements, suggesting areas for enhancement.'),
                  featureDescription('Courses Section',
                      'The app includes a courses section where users can access a variety of courses on different topics. These courses are designed to help users develop skills and knowledge relevant to their desired career paths.'),
                  featureDescription('Profile Section',
                      'Users can create and manage their profiles within the app. The profile section displays the user\'s name, email address, preferred topics, and profile picture. Users can update their information and preferences as needed.'),
                  featureDescription('Settings',
                      'The settings section offers various customization options, allowing users to adjust the app\'s functionality to suit their preferences.'),
                  SizedBox(height: 20),
                  Text(
                    'User Experience',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'The app is designed with user experience in mind, ensuring that all features are easy to access and use. The intuitive navigation and responsive design make it easy for users to find and utilize the tools they need to improve their interview preparation.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Technology',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '• Flutter Framework: The app is built using the Flutter framework, which allows for a single codebase to be used across multiple platforms, including iOS and Android. This ensures a consistent user experience and reduces development time.\n• Responsive Design: The app\'s UI is designed to be fully responsive, adapting to different screen sizes and orientations seamlessly.\n• Interactive Elements: Features like the quiz section and Assistant Arya incorporate interactive elements that engage users and provide a more dynamic learning experience.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Conclusion',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Our Flutter app is a powerful tool for anyone looking to improve their interview preparation. With features like ATS core analysis, interactive quizzes, resume checking, and a wide range of courses, users can comprehensively prepare for their job interviews. The app\'s dynamic UI and responsive design ensure a smooth and engaging experience across all devices.',
                    style: TextStyle(fontSize: 16),
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

 Widget featureDescription(String title, String description) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            description,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

