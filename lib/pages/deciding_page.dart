import 'package:eduguide/pages/register_page.dart';
import 'package:eduguide/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DecidingPage extends StatelessWidget {
  const DecidingPage({super.key});

  Future<void> _saveRole(String role) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_role', role);
  }

  void _onRoleSelected(BuildContext context, String role) async {
    await _saveRole(role);
    // Navigate to the next page or perform any action after saving the role
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue[100]!,
              Colors.blue[100]!,
              Colors.blue[100]!,
              Colors.blue[100]!,
              Colors.blue[100]!,
              Colors.blue[100]!,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "DECIDE YOUR ROLE",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            my_button(
              ontap: () {
                _onRoleSelected(context, 'user');
              },
              text: 'Go as a User',
            ),
            const SizedBox(height: 20),
            my_button(
              ontap: () {
                _onRoleSelected(context, 'mentor');
              },
              text: ('Go as a Mentor'),
            ),
          ],
        ),
      ),
    );
  }
}
