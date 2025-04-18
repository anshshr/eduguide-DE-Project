// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: camel_case_types, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class my_textfield extends StatelessWidget {
  final String hint_text;
  final bool obs_text;
  final TextEditingController controlller;
  final IconButton? icon;

  my_textfield({
    Key? key,
    required this.hint_text,
    required this.obs_text,
    required this.controlller,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controlller,
      obscureText: obs_text,
      decoration: InputDecoration(
          hintText: hint_text,
          suffixIcon: icon,
          label: Text(hint_text),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(
                color: Colors.black, style: BorderStyle.solid, width: 1.5),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 13),
          border: UnderlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(
                color: Colors.purple[200]!,
                width: 30,
                style: BorderStyle.solid),
          )),
    );
  }
}
