// ignore_for_file: non_constant_identifier_names

import 'package:eduguide/services/send_email.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/my_button.dart';
import '../../widgets/my_dialog.dart';

Future problem_dialog(BuildContext context) {
  TextEditingController problem = TextEditingController();
  return showDialog(
    context: context,
    builder: (context) {
      return SingleChildScrollView(
        child: AlertDialog(
          title: Text(
            'REPORT YOUR PROBLEM',
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
          backgroundColor: Colors.grey[100],
          actions: [
            //problem
            TextField(
              controller: problem,
              maxLines: 10,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.black87, width: 3.5, strokeAlign: 2),
                    borderRadius: BorderRadius.circular(20)),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                hintText: 'Enter your Problem',
              ),
            ),
            SizedBox(
              height: 20,
            ),

            my_button(
                text: 'S U B M I T',
                ontap: () async {
                  if (problem.text != "") {
                    SharedPreferences pref =
                        await SharedPreferences.getInstance();
                    print('sending email');
                    await send_email_from_app(
                        pref.getString('name')!,
                        pref.getString('email')!,
                        'anshshriofficial@gmail.com',
                        'PROBLEM REPORT OF MARGDARSHAK',
                        problem.text);
                    print('email sent');
                    Navigator.pop(context);
                  } else {
                    dialog(context, 'Please Enter all the Details');
                  }
                })
          ],
        ),
      );
    },
  );
}

Future feedback_dialog(BuildContext context) {
  TextEditingController feedback = TextEditingController();
  return showDialog(
    context: context,
    builder: (context) {
      return SingleChildScrollView(
        child: AlertDialog(
          title: Text(
            'ENTER YOUR FEEDBACK',
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
          backgroundColor: Colors.grey[100],
          actions: [
            //feedback
            TextField(
              controller: feedback,
              maxLines: 10,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.black87, width: 3.5, strokeAlign: 2),
                    borderRadius: BorderRadius.circular(20)),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                hintText: 'Enter your Feedback',
              ),
            ),
            SizedBox(
              height: 20,
            ),

            my_button(
                text: 'S U B M I T',
                ontap: () async {
                  if (feedback.text != "" && feedback.text.isNotEmpty) {
                    SharedPreferences pref =
                        await SharedPreferences.getInstance();
                    print('sending email');
                    await send_email_from_app(
                        pref.getString('name')!,
                        pref.getString('email')!,
                        'anshshriofficial@gmail.com',
                        'FEEDBACK OF MARGDARSHAK APP',
                        feedback.text);
                    print('email sent');
                    Navigator.pop(context);
                  } else {
                    dialog(context, 'Please Enter all the Details');
                  }
                })
          ],
        ),
      );
    },
  );
}
