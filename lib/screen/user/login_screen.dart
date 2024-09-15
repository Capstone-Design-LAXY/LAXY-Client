import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:laxy/common/component/background.dart';
import 'package:laxy/common/component/custom/custom_app_bar.dart';
import 'package:laxy/common/component/custom/custom_text_field.dart';
import 'package:laxy/common/component/page_route_with_animation.dart';
import 'package:laxy/common/component/show_dialog.dart';
import 'package:laxy/screen/user/register_screen.dart';
import 'package:laxy/common/const/constants.dart';
import 'package:http/http.dart' as http;

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

  // 이메일 및 비밀번호 검증
  bool _validateForm() {
    String email = emailController.text;
    String password = passwordController.text;
    if (email.isEmpty && password.isEmpty){
      emailKey.currentState?.setError('이메일을 입력하세요.');
      passwordKey.currentState?.setError('비밀번호를 입력하세요.');
      return false;
    }
    if (email.isEmpty){
      emailKey.currentState?.setError('이메일을 입력하세요.');
      return false;
    }
    if (password.isEmpty) {
      passwordKey.currentState?.setError('비밀번호를 입력하세요.');
      return false;
    }
    if (!_isEmailValid(email)) {
      emailKey.currentState?.setError('유효한 이메일 형식이 아닙니다.');
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

  // TODO: 연결 필요
  // 로그인 처리 함수 (API 요청)
  Future<void> _handleLogin() async {
    if (_validateForm()) {
      String email = emailController.text;
      String password = passwordController.text;

      final url = Uri.parse('$BASE_URL/login');

      // HTTP 클라이언트 생성
      final client = http.Client();

      try {
        final response = await client.post(
          url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'email': email,
            'password': password,
          }),
          // 요청 시간 초과 설정 (예: 10초)
        ).timeout(Duration(seconds: 5));

        if (response.statusCode == 200) {
          // 로그인 성공 시 처리 (홈 화면으로 이동)
          Navigator.pushReplacementNamed(context, '/home');
        } else {
          // 로그인 실패 시 처리 (오류 메시지 보여주기)
          showErrorDialog(context, '로그인에 실패했습니다. 상태 코드: ${response.statusCode}');
        }
      } on TimeoutException catch (_) {
        // 시간 초과 오류 처리
        showErrorDialog(context, '요청이 시간 초과되었습니다. 인터넷 연결을 확인해 주세요.');
      } catch (error) {
        // 네트워크 오류 처리
        showErrorDialog(context, '로그인 요청 중 오류가 발생했습니다: $error');
      } finally {
        client.close(); // HTTP 클라이언트 자원 해제
      }
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
                    // 로고 이미지
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/LAXY_highqual_logo.png',
                          width: 70,
                          height: 70,
                        ),
                        SizedBox(width: 10,),
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
                    // 아이디 입력 필드
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          CustomTextField(
                            key: emailKey,
                            controller: emailController, // 입력값을 컨트롤러로 받음
                            textInputAction: TextInputAction.next,
                            labelText: '이메일',
                          ),
                          SizedBox(height: 20),
                          // 비밀번호 입력 필드
                          CustomTextField(
                            key: passwordKey,
                            controller: passwordController, // 입력값을 컨트롤러로 받음
                            obscureText: true,
                            labelText: '비밀번호',
                            onSubmitted: (value) {_handleLogin();},
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    // 로그인 및 회원가입 버튼
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
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
                        ElevatedButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Color(0xFFFFFFFF),
                            foregroundColor: Color(0xFF5589D3),
                          ),
                          onPressed: _handleLogin, // 로그인 버튼 클릭 시 호출
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
