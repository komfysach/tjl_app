import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  // const TextField({Key? key}) : super(key: key);
  final String hintText;
  final bool obscureText;
  final IconData icon;
  final Color iconColor;
  final FormFieldValidator validator;
  MyTextField(
      {required this.hintText,
      required this.obscureText,
      required this.icon,
      required this.iconColor,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
          prefixIcon: Icon(icon, color: iconColor),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white, fontFamily: "NeutralFace"),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.amber.shade600))),
    );
  }
}
