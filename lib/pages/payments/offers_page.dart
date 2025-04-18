// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:eduguide/my%20widgets/my_button.dart';
import 'package:eduguide/pages/payments/payment_page.dart';
import 'package:flutter/material.dart';

class OffersPage extends StatefulWidget {
  const OffersPage({super.key});

  @override
  State<OffersPage> createState() => _OffersPageState();
}

class _OffersPageState extends State<OffersPage> {
  TextStyle heading_style =
      TextStyle(fontWeight: FontWeight.w900, fontSize: 18);

  TextStyle normal_text = TextStyle(fontWeight: FontWeight.bold, fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 50,left: 10,right: 10),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.green[100]!,
          Colors.green[200]!,
          Colors.green[200]!,
          Colors.green[100]!,
          Colors.green[200]!,
        ])),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Subscription Plans',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 10,),
              //free offer card
              Card(
                  shadowColor: Colors.grey,
                  borderOnForeground: true,
                  color: Colors.white,
                  elevation: 10,
                
                  child: Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Current Plan: Free', style: heading_style),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                            'As a free user, you have access to the following features:',
                            style: normal_text),
                        SizedBox(
                          height: 10,
                        ),
                        Text('➡️ Basic App Overview and Features',
                            style: normal_text),
                        SizedBox(
                          height: 10,
                        ),
                        Text('➡️Limited Access to Quiz Section',
                            style: normal_text),
                        SizedBox(
                          height: 10,
                        ),
                        Text('➡️Resume Checker with Basic Analysis',
                            style: normal_text),
                        SizedBox(
                          height: 10,
                        ),
                        Text('➡️Access to Introductory Courses',
                            style: normal_text),
                        SizedBox(
                          height: 10,
                        ),
                        Text('➡️Profile Section for Basic User Management',
                            style: normal_text),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                            'To unlock more advanced features and get the most out of your interview preparation, consider upgrading to one of our subscription plans.',
                            style: normal_text),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  )),
              SizedBox(height: 10,),

              //monthly subscription
              Card(
                  shadowColor: Colors.grey,
                  borderOnForeground: true,
                  color: Colors.white,
                  elevation: 10,
                  child: 
                      Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: Column(
                          children: [
                            Text(
                              'Monthly Subscription',
                              style: heading_style,
                            ),
                            SizedBox(
                          height: 10,
                        ),
                            Text(
                              'For just 299/- per month, you will gain access to:',
                              style: normal_text,
                            ),
                            SizedBox(
                          height: 10,
                        ),
                            Text(
                              '⭐Unlimited Access to Quiz Section: Take unlimited quizzes on various topics to prepare thoroughly.',
                              style: normal_text,
                            ),
                            SizedBox(
                          height: 10,
                        ),
                            Text(
                              '⭐Enhanced Resume Checker: Get in-depth analysis and personalized feedback on your resume compared to job descriptions.',
                              style: normal_text,
                            ),
                            SizedBox(
                          height: 10,
                        ),
                            Text(
                              '⭐Full Courses Access: Explore and complete all available courses in our comprehensive library.',
                              style: normal_text,
                            ),
                            SizedBox(
                          height: 10,
                        ),
                            Text(
                              '⭐Advanced Assistant Arya Features: Receive more personalized hints, suggestions, and feedback from Arya during quizzes.',
                              style: normal_text,
                            ),
                            SizedBox(
                          height: 10,
                        ),
                            Text(
                              '⭐Priority Customer Support: Get priority access to our support team for any assistance you may need.',
                              style: normal_text,
                            ),
                            SizedBox(
                          height: 10,
                        ),
                          
                        my_button(
                            text: 'PAY 299/-',
                            ontap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PaymentPage(amount: '299',),
                                  ));
                            })
                                            ],
                                          ),
                      )),
                  SizedBox(height: 10,),
              //yearly subscription
              Card(
                  shadowColor: Colors.grey,
                  borderOnForeground: true,
                  color: Colors.white,
                  elevation: 10,
                  child: 
                      Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: Column(
                          children: [
                            Text(
                              'Yearly Subscription',
                              style: heading_style,
                            ),
                            SizedBox(
                          height: 10,
                        ),
                            Text(
                              'For 2999 per year (a savings of over 30% compared to the monthly plan), you will enjoy:',
                              style: normal_text,
                            ),
                            SizedBox(
                          height: 10,
                        ),
                            Text(
                              '⭐All Monthly Subscription Benefits: All features listed in the monthly plan are included.',
                              style: normal_text,
                            ),
                            SizedBox(
                          height: 10,
                        ),
                            Text(
                              '⭐Exclusive Monthly Webinars: Participate in exclusive webinars with industry experts to enhance your interview skills.',
                              style: normal_text,
                            ),
                            SizedBox(
                          height: 10,
                        ),
                            Text(
                              '⭐Early Access to New Features: Be the first to try out new features and improvements before they are available to the public.',
                              style: normal_text,
                            ),
                            SizedBox(
                          height: 10,
                        ),
                            Text(
                              '⭐Customized Learning Path: Get a tailored learning path based on your career goals and preferences.',
                              style: normal_text,
                            ),
                            SizedBox(
                          height: 10,
                        ),
                            Text(
                              '⭐Extended Resume Checker Insights: Access advanced analytics and detailed feedback to improve your resume.',
                              style: normal_text,
                            ),
                            SizedBox(
                          height: 10,
                        ),
                          
                        my_button(
                            text: 'PAY 2999/-',
                            ontap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PaymentPage(amount: '2999',),
                                  ));
                            })
                                            ],
                                          ),
                      )),
            ],
          ),
        ),
      ),
    );
  }
}
