// ignore_for_file: prefer_const_literals_to_create_immutables, use_build_context_synchronously, prefer_const_constructors, non_constant_identifier_names

import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../my widgets/my_dialog.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? name;
  File? file;
  String? email;
  List courses = [];
  String? course_list = "";
  final ImagePicker picker = ImagePicker();
 Future<void> getProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name');
      email = prefs.getString('email');
      courses = prefs.getStringList('courses selected') ?? [];
      course_list = courses.join(", ");
      String? filePath = prefs.getString('profile_picture');
      if (filePath != null && filePath.isNotEmpty) {
        file = File(filePath);
      }
    });
  }

  void get_courses() {
    setState(() {
      course_list = courses.join(" , ");
    });
  }

  @override
  void initState() {
    super.initState();
    getProfileData();
  }

  Future pick_photo() async {
    final picked_file = await FilePicker.platform.pickFiles(
        allowedExtensions: ['jpeg', 'jpg', 'avif', 'png'],
        type: FileType.custom);

    if (picked_file == null) {
      dialog(context, 'Please pick a Profile picture');
      return;
    }
     final path = picked_file.files.single.path!;
    final directory = await getApplicationDocumentsDirectory();
    final newFilePath = '${directory.path}/${picked_file.files.single.name}';
    final newFile = await File(path).copy(newFilePath);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('profile_picture', newFile.path);

    setState(() {
      file = newFile;
    });

  }

  Future camera_image() async {
    final XFile? selected_image =
        await picker.pickImage(source: ImageSource.camera);

    if (selected_image == null) {
      dialog(context, 'Please select an image');
      return;
    }

    
    final directory = await getApplicationDocumentsDirectory();
    final newFilePath = '${directory.path}/${selected_image.name}';
    final newFile = await File(selected_image.path).copy(newFilePath);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('profile_picture', newFile.path);

    setState(() {
      file = newFile;
    });

  }

  Future select_menu(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actionsAlignment: MainAxisAlignment.center,
          elevation: 6,
          title: Text(
            'Please select any one of them',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.grey[200],
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  GestureDetector(
                    child: Icon(
                      Icons.camera_sharp,
                      color: Colors.black87,
                      size: 40,
                    ),
                    onTap: () async {
                      await camera_image();
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(
                    width: 35,
                  ),
                  GestureDetector(
                    child: Icon(
                      Icons.photo_size_select_actual,
                      color: Colors.black87,
                      size: 40,
                    ),
                    onTap: () async {
                      await pick_photo();
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(
                    width: 35,
                  ),
                  GestureDetector(
                    child: Icon(
                      Icons.no_accounts_sharp,
                      color: Colors.black87,
                      size: 40,
                    ),
                    onTap: () {
                      setState(() {
                        file = null;
                      });
                      SharedPreferences.getInstance().then((prefs) {
                        prefs.remove('profile_picture');
                      });
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        backgroundColor: Colors.purple[100],
        title: Text(
          'P R O F I L E   P A G E',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              const Color.fromARGB(255, 223, 199, 228),
              const Color.fromARGB(255, 223, 199, 228),
              const Color.fromARGB(255, 223, 199, 228),
              const Color.fromARGB(255, 223, 199, 228),
            ])),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //greeting the user
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Hello  $name',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              SizedBox(
                height: 20,
              ),

              //space for uploading photo with circular avatar
              Stack(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey[100],
                    radius: 100,
                    child: Center(
                        child: file == null
                            ? Icon(
                                Icons.person,
                                color: Colors.black87,
                                size: 170,
                              )
                            : ClipOval(
                                child: Align(
                                    alignment: Alignment.topCenter,
                                    child: Image.file(
                                      file!,
                                      fit: BoxFit.cover,
                                      height: 200,
                                      width: 200,
                                    )),
                              )),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.add_a_photo_rounded,
                      size: 30,
                    ),
                    onPressed: () {
                      select_menu(context);
                    },
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),

              //name during registration
              Card(
                  shadowColor: Colors.grey,
                  borderOnForeground: true,
                  color: Colors.white,
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 15),
                    child: Text(
                      'Name : - $name',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              //email during registration
              Card(
                  shadowColor: Colors.grey,
                  borderOnForeground: true,
                  color: Colors.white,
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 15),
                    child: Text(
                      'Email I.D. :- $email',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  )),
              SizedBox(
                height: 20,
              ),

              //user selected topic while entering the app
              Card(
                  shadowColor: Colors.grey,
                  borderOnForeground: true,
                  color: Colors.white,
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    child: Text(
                      'Languages Known :- $course_list',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
