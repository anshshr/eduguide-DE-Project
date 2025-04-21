import 'package:eduguide/bottom_navigation.dart';
import 'package:eduguide/firebase_options.dart';
import 'package:eduguide/pages/video_call_feature/experts_list.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/liquid swipe/swipe_pages.dart';
import 'package:stream_video_flutter/stream_video_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SharedPreferences pref = await SharedPreferences.getInstance();
  print(pref.getBool('login'));

  final client = StreamVideo(
    'mmhfdzb5evj2',
    user: User.regular(
      userId: 'Cade_Skywalker',
      role: 'admin',
      name: pref.getString('name') ?? 'Ansh Shrivastav',
    ),
    userToken:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJodHRwczovL3Byb250by5nZXRzdHJlYW0uaW8iLCJzdWIiOiJ1c2VyL0NhZGVfU2t5d2Fsa2VyIiwidXNlcl9pZCI6IkNhZGVfU2t5d2Fsa2VyIiwidmFsaWRpdHlfaW5fc2Vjb25kcyI6NjA0ODAwLCJpYXQiOjE3NDUyNDg2MjQsImV4cCI6MTc0NTg1MzQyNH0.f5x4bv-yLxX41It_ay3e0k8mkkhFKZLrLgFTqLO1h6c',
  );

  print(client);

  runApp(
    MaterialApp(
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      title:
          'Helping students to get their interview cleared in minimal effort',
      home:
          pref.getBool('login') == false || pref.getBool('login') == null
              ? SwipePages()
              : BottomNavigation(),
    ),
  );
}
