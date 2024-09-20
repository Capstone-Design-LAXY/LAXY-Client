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

  String? accessToken = ""; //user의 정보를 저장하기 위한 변수
  static final storage = new FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   _asyncMethod();
    // });
  }

  // 비동기로 FlutterSecureStorage 정보 불러오기
  _asyncMethod() async {
    //read 함수를 통하여 key값에 맞는 정보를 불러오게 됩니다. 이때 불러오는 결과의 타입은 String 타입임을 기억해야 합니다.
    //(데이터가 없을때는 null을 반환을 합니다.)
    accessToken = await storage.read(key: "accessToken");
    print(accessToken);

    //user의 정보가 있다면 바로 로그아웃 페이지로 넝어가게 합니다.
    if (accessToken != null) {
      // Navigator.push(context, MaterialPageRoute(builder: (context) => TrendsScreen()));
    }
  }

  // 이메일 및 비밀번호 검증
  bool _validateForm() {
    String email = emailController.text;
    String password = passwordController.text;
    if (email.isEmpty){
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

  // TODO: 연결 필요
  // 로그인 처리 함수 (API 요청)
  Future<void> _handleLogin() async {
    if (_validateForm()) {
      String email = emailController.text;
      String password = passwordController.text;
      print('email: ' + email);
      print('password: ' + password);

      await storage.write(
        key: 'accessToken',
        value: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c',
      );

      // Read all values
      Map<String, String> allValues = await storage.readAll();

      // Print all values
      allValues.forEach((key, value) { print('$key: $value'); });

      PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(MindmapScreen());
      Navigator.pushAndRemoveUntil(
        context,
        PageRouteWithAnimation(MindmapScreen()).slideRitghtToLeft(),
            (Route<dynamic> route) => false,
      );

      // final url = Uri.parse('$BASE_URL/login');
      //
      // // HTTP 클라이언트 생성
      // final client = http.Client();
      //
      // try {
      //   final response = await client.post(
      //     url,
      //     headers: <String, String>{
      //       'Content-Type': 'application/json; charset=UTF-8',
      //     },
      //     body: jsonEncode(<String, String>{
      //       'email': email,
      //       'password': password,
      //     }),
      //     // 요청 시간 초과 설정 (예: 10초)
      //   ).timeout(Duration(seconds: 5));
      //
      //   if (response.statusCode == 200) {
      //     // 로그인 성공 시 처리 (홈 화면으로 이동)
      //     Navigator.pushReplacementNamed(context, '/home');
      //   } else {
      //     // 로그인 실패 시 처리 (오류 메시지 보여주기)
      //     showErrorDialog(context, '로그인에 실패했습니다. 상태 코드: ${response.statusCode}');
      //   }
      // } on TimeoutException catch (_) {
      //   // 시간 초과 오류 처리
      //   showErrorDialog(context, '요청이 시간 초과되었습니다. 인터넷 연결을 확인해 주세요.');
      // } catch (error) {
      //   // 네트워크 오류 처리
      //   showErrorDialog(context, '로그인 요청 중 오류가 발생했습니다: $error');
      // } finally {
      //   client.close(); // HTTP 클라이언트 자원 해제
      // }
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
                            onSubmitted: (value) {_handleLogin();},
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
                          onPressed: _handleLogin,
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
