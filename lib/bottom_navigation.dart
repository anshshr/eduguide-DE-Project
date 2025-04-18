import 'package:eduguide/pages/home%20page/start_page.dart';
import 'package:eduguide/pages/profile%20page/profile.dart';
import 'package:eduguide/pages/settings%20details/settings.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  List pages = [StartPage(), Profile(), Settings()];
  int current_index = 0;
  void ontabtaapped(int index) {
    setState(() {
      current_index = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[current_index],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 172, 186, 198),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: GNav(
              gap: 8,
              backgroundColor: Color.fromARGB(255, 172, 186, 190),
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor: Colors.black,
              padding: EdgeInsets.all(20),
              selectedIndex: 0,
              onTabChange: ontabtaapped,
              iconSize: 25,
              tabs: [
                GButton(icon: Icons.home, text: 'Home'),
                GButton(icon: Icons.person, text: 'Profile'),
                GButton(icon: Icons.settings, text: 'Settings'),
              ]),
        ),
      ),
    );
  }
}
