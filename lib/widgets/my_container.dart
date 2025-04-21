// ignore_for_file: public_member_api_docs, sort_constructors_first, camel_case_types, must_be_immutable, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names
import 'package:flutter/material.dart';

class my_container extends StatelessWidget {
  String url;
  final String title_text;
  final String desc_text;
  final Icon base_icon;

  my_container({
    Key? key,
    required this.url,
    required this.title_text,
    required this.desc_text,
    required this.base_icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(
                color: Colors.black, width: 2, style: BorderStyle.solid),
            borderRadius: BorderRadius.all(Radius.circular(25))),
        child: Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.network(
                  url,
                  fit: BoxFit.cover,
                  height: 2000,
                  width: 2000,
                )),
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(children: [
                    //icon for the feature
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Icon(
                        Icons.star,
                        size: 27,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    //title of the feature
                    Text(
                      title_text,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ]),
                  SizedBox(
                    height: 4,
                  ),

                  //center icons for display
                  base_icon,

                  SizedBox(
                    height: 5,
                  ),
                  //description text
                  Padding(
                    padding: const EdgeInsets.only(left: 13),
                    child: Text(
                      desc_text,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
