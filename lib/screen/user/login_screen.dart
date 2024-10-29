import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:laxy/common/component/background.dart';
import 'package:laxy/common/component/custom/custom_app_bar.dart';
import 'package:laxy/common/component/custom/custom_text_field.dart';
import 'package:laxy/common/component/page_route_with_animation.dart';
import 'package:laxy/common/component/show_dialog.dart';
import 'package:laxy/screen/main/mindmap_screen.dart';
import 'package:laxy/screen/main/trends_screen.dart';
import 'package:laxy/screen/user/register_screen.dart';
import 'package:laxy/common/const/constants.dart';
import 'package:http/http.dart' as http;
import 'package:laxy/utils/http_utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<CustomTextFieldState> emailKey = GlobalKey<CustomTextFieldState>();
  final GlobalKey<CustomTextFieldState> passwordKey = GlobalKey<CustomTextFieldState>();

  @override
  void initState() {
    super.initState();
  }

  // 이메일 및 비밀번호 검증
  bool _validateForm() {
    String email = emailController.text;
    String password = passwordController.text;
    if (email.isEmpty) {
      emailKey.currentState?.setError('이메일을 입력하세요.');
      return false;
    }
    if (!_isEmailValid(email)) {
      emailKey.currentState?.setError('유효한 이메일 형식이 아닙니다.');
      return false;
    }
    if (password.isEmpty) {
      passwordKey.currentState?.setError('비밀번호를 입력하세요.');
      return false;
    }
    emailKey.currentState?.setError(null);
    passwordKey.currentState?.setError(null);
    return true;
  }

  // 이메일 형식 검증
  bool _isEmailValid(String email) {
    String emailPattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&\'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regExp = RegExp(emailPattern);
    return regExp.hasMatch(email);
  }

  Future<void> _login() async {
    // 입력 검증
    if (!_validateForm()) return;

    String email = emailController.text;
    String password = passwordController.text;

    try {
      await loginUser(context, email: email, password: password);
      // 로그인 성공 후의 추가 처리 (예: 메인 화면으로 이동)
      PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(MindmapScreen());
      Navigator.pushAndRemoveUntil(
        context,
        PageRouteWithAnimation(MindmapScreen()).slideRightToLeft(),
            (Route<dynamic> route) => false,
      );
    } catch (e) {
      // 오류 처리 (예: 에러 메시지 표시)
      print('로그인 오류: $e');
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: '로그인',
      ),
      body: Stack(
        children: [
          Background(rotate: true,),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // 로고 이미지
                        Image.asset(
                          'assets/LAXY_highqual_logo.png',
                          width: 70,
                          height: 70,
                        ),
                        SizedBox(width: 10,),
                        // 로고
                        Text(
                          'LAXY',
                          style: TextStyle(
                            fontSize: 35,
                            color: Color(0xFFFFFFFF),
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          // 이메일 입력 필드
                          CustomTextField(
                            key: emailKey,
                            controller: emailController,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            labelText: '이메일',
                          ),
                          SizedBox(height: 20),
                          // 비밀번호 입력 필드
                          CustomTextField(
                            key: passwordKey,
                            controller: passwordController,
                            obscureText: true,
                            labelText: '비밀번호',
                            onSubmitted: (value) {_login();},
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // 회원가입 버튼
                        TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Color(0xFF5589D3),
                          ),
                          onPressed: () {
                            PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(RegisterScreen());
                            Navigator.push(context, pageRouteWithAnimation.fadeTransition());
                          },
                          child: Text(
                            '회원가입',
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                        // 로그인 버튼
                        ElevatedButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Color(0xFFFFFFFF),
                            foregroundColor: Color(0xFF5589D3),
                          ),
                          onPressed: _login,
                          child: Text('로그인'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
