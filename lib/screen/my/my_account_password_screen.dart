import 'dart:async';

import 'package:flutter/material.dart';
import 'package:laxy/common/component/background.dart';
import 'package:laxy/common/component/custom/custom_app_bar.dart';
import 'package:laxy/common/component/custom/custom_radio.dart';
import 'package:laxy/common/component/custom/custom_text_field.dart';
import 'package:laxy/common/component/list/text_list_tile.dart';
import 'package:laxy/common/component/page_route_with_animation.dart';
import 'package:laxy/screen/main/trends_screen.dart';
import 'package:laxy/screen/my/bookmarked_screen.dart';
import 'package:laxy/screen/user/login_screen.dart';
import 'package:laxy/screen/user/register_screen.dart';
import 'package:laxy/utils/http_utils.dart';

class MyAccountPasswordScreen extends StatefulWidget {
  final String nickname;
  final String email;

  const MyAccountPasswordScreen({
    required this.email,
    required this.nickname,
    super.key
  });

  @override
  State<MyAccountPasswordScreen> createState() => _MyAccountPasswordScreenState();
}

class _MyAccountPasswordScreenState extends State<MyAccountPasswordScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<CustomTextFieldState> passwordKey = GlobalKey<CustomTextFieldState>();
  final GlobalKey<CustomTextFieldState> confirmPasswordKey = GlobalKey<CustomTextFieldState>();

  // 비밀번호 검증
  bool _isPasswordValid() {
    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;
    if (password.isEmpty) {
      confirmPasswordKey.currentState?.setError(null);
      passwordKey.currentState?.setError('비밀번호를 입력하세요.');
      return false;
    }
    if (confirmPassword.isEmpty) {
      passwordKey.currentState?.setError(null);
      confirmPasswordKey.currentState?.setError('비밀번호 확인을 입력하세요.');
      return false;
    }
    if (password != confirmPassword){
      confirmPasswordKey.currentState?.setError('비밀번호와 일치하지 않습니다.');
      return false;
    }
    passwordKey.currentState?.setError(null);
    confirmPasswordKey.currentState?.setError(null);
    return true;
  }

  Future<void> _edit() async {
    if (!_isPasswordValid()) return;
    try {
      await editUser(context,
        password: passwordController.text,
      );
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => LoginScreen()), // 홈 화면으로 이동
          (Route<dynamic> route) => false, // 모든 기존 라우트 제거
      );
    } catch (e) {
      print('회원정보수정 오류: $e');
    }
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar(
        title: '비밀번호 변경',
      ),
      body: Stack(
        children: [
          Background(rotate: true,),
          // 앱의 다른 콘텐츠
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // 로고 이미지
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/LAXY_highqual_logo.png', // 로고 이미지 경로
                          width: 70,
                          height: 70,
                        ),
                        SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.nickname,
                              style: TextStyle(
                                fontSize: 25,
                                color: Color(0xFFFFFFFF),
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Text(
                              widget.email,
                              style: TextStyle(
                                fontSize: 15,
                                color: Color(0xFFFFFFFF),
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    // 아이디 입력 필드
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          // 비밀번호 입력 필드
                          CustomTextField(
                            key: passwordKey,
                            controller: passwordController,
                            textInputAction: TextInputAction.next,
                            obscureText: true,
                            labelText: '비밀번호',
                          ),
                          SizedBox(height: 10),
                          // 비밀번호 입력 필드
                          CustomTextField(
                            key: confirmPasswordKey,
                            controller: confirmPasswordController,
                            textInputAction: TextInputAction.next,
                            obscureText: true,
                            labelText: '비밀번호 확인',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    // 로그인 버튼
                    ElevatedButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xFFFFFFFF),
                        foregroundColor: Color(0xFF5589D3),
                      ),
                      onPressed: () {
                        _edit();
                      },
                      child: Text('비밀번호 변경'),
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
