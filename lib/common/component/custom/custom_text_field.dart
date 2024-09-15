import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final String labelText;

  /// (value) { _handle(); } 형식
  final Function(String)? onSubmitted;

  const CustomTextField({
    this.controller,
    this.textInputAction,
    this.obscureText = false,
    this.labelText = 'labelText',
    this.onSubmitted,
    super.key
  });

  /// ErrorText를 외부에서 계속 불러와야하므로 public으로 선언
  @override
  CustomTextFieldState createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomTextField> {
  String? errorText;

  /// 오류 메시지가 있다면 String, 없다면 null을 입력 (null일때 입력 필요)
  void setError(String? error) {
    setState(() {
      errorText = error; // 오류 메시지 상태를 변경
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      textInputAction: widget.textInputAction,
      onSubmitted: widget.onSubmitted,
      obscureText: widget.obscureText,
      cursorColor: Color(0xFF5589D3),
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: TextStyle(
          color: Color(0xFF5589D3),
        ),
        // 일반 상태 테두리
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF5589D3),
          ),
        ),
        // 포커스된 상태의 테두리
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF5589D3),
          ),
        ),
        // 오류 메시지
        errorText: errorText,
        // 오류가 있을 때 테두리
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        // 포커스된 오류 상태의 테두리 색상
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
