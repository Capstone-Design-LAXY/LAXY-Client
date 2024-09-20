import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String labelText;
  final String? hintText;
  final int? digitMaxInput;

  /// (value) { _handle(); } 형식
  final Function(String)? onSubmitted;

  const CustomTextField({
    this.controller,
    this.textInputAction,
    this.keyboardType,
    this.obscureText = false,
    this.labelText = 'labelText',
    this.onSubmitted,
    this.hintText,
    this.digitMaxInput,
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
      keyboardType: widget.keyboardType,
      inputFormatters: widget.digitMaxInput != null
        ? <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly, // 숫자만 허용
            LengthLimitingTextInputFormatter(widget.digitMaxInput), // 최대 입력 자리 제한
          ]
        : null,
      cursorColor: Color(0xFF5589D3),
      decoration: InputDecoration(
        // 힌트 텍스트
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: Colors.grey
        ),
        // 라벨 텍스트
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
        // 오류 텍스트
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
