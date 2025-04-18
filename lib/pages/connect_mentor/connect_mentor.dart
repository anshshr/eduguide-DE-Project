import 'package:flutter/material.dart';

class ConnectMentor extends StatelessWidget {
  const ConnectMentor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 50),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue[100]!,
              Colors.blue[200]!,
              Colors.blue[300]!,
              Colors.blue[400]!,
              Colors.blue[500]!,
            ],
          ),
        ),

      ),
    );
  }
}
