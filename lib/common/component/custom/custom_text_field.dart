import 'dart:ffi';

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final String labelText;

  const CustomTextField({
    this.controller,
    this.textInputAction,
    this.obscureText = false,
    this.labelText = 'labelText',
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller, // 입력값을 컨트롤러로 받음
      textInputAction: textInputAction,
      obscureText: obscureText,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF5589D3),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF5589D3),
          ),
        ),
        labelText: labelText,
        labelStyle: TextStyle(
          color: Color(0xFF5589D3),
        ),
      ),
      cursorColor: Color(0xFF5589D3),
    );
  }
}
