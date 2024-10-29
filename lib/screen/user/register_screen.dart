import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:laxy/common/component/background.dart';
import 'package:laxy/common/component/custom/custom_app_bar.dart';
import 'package:laxy/common/component/custom/custom_radio.dart';
import 'package:laxy/common/component/custom/custom_text_field.dart';
import 'package:laxy/common/component/horizontal_expanded.dart';
import 'package:laxy/common/component/list/text_list_tile.dart';
import 'package:laxy/utils/http_utils.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController nicknameController = TextEditingController();
  final GlobalKey<CustomTextFieldState> emailKey = GlobalKey<CustomTextFieldState>();
  final GlobalKey<CustomTextFieldState> passwordKey = GlobalKey<CustomTextFieldState>();
  final GlobalKey<CustomTextFieldState> confirmPasswordKey = GlobalKey<CustomTextFieldState>();
  final GlobalKey<CustomTextFieldState> nicknameKey = GlobalKey<CustomTextFieldState>();
  bool isBirthday = false;
  bool isBirthdayValid = true;
  DateTime birthday = DateTime(1900-1-1);
  SingingCharacter? _selectedGender = SingingCharacter.N; // 선택된 성별 저장

  // 이메일 검증
  bool _isEmailValid() {
    String email = emailController.text;
    if (email.isEmpty){
      emailKey.currentState?.setError('이메일을 입력하세요.');
      return false;
    }
    String emailPattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&\'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regExp = RegExp(emailPattern);
    if (!regExp.hasMatch(email)){
      emailKey.currentState?.setError('유효한 이메일 형식이 아닙니다.');
      return false;
    }
    emailKey.currentState?.setError(null);
    return true;
  }

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

  // 닉네임 검증
  bool _isNicknameValid() {
    String nickname = nicknameController.text;
    if (nickname.isEmpty){
      nicknameKey.currentState?.setError('닉네임을 입력하세요.');
      return false;
    }
    nicknameKey.currentState?.setError(null);
    return true;
  }

  // 생년월일 검증
  bool _isBirthdayValid() {
    if (birthday.year == DateTime(1900-1-1).year &&
        birthday.month == DateTime(1900-1-1).month &&
        birthday.day == DateTime(1900-1-1).day) {
      setState(() {
        isBirthdayValid = false;
      });
      return false;
    }
    setState(() {
      isBirthdayValid = true;
    });
    return true;
  }

  // TODO: 연결 필요
  // 입력 필드 검증
  bool _validateFrom() {
    String email = emailController.text;
    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;
    String nickname = nicknameController.text;
    if (_isEmailValid() && _isPasswordValid() && _isNicknameValid() && _isBirthdayValid()){
      print('email: '+email);
      print('password: '+password);
      print('confirmPassword: '+confirmPassword);
      print('nickname: '+nickname);
      print('birthday: ${birthday.year} - ${birthday.month} - ${birthday.day}');
      print('gender: ${_selectedGender.toString().split('.').last}');
      // Navigator.pop(context);
      return true;
    }
    return false;
  }

  // 서버에 회원가입 요청 보내기
  Future<void> _register() async {
    if (!_validateFrom()) return; // 입력 검증

    // 요청 데이터
    String birth = '${birthday.year}-${birthday.month.toString().padLeft(2, '0')}-${birthday.day.toString().padLeft(2, '0')}';
    String gender = _selectedGender.toString().split('.').last; // 성별

    try {
      await registerUser(
        context,
        email: emailController.text,
        password: passwordController.text,
        name: nicknameController.text,
        birth: birth,
        gender: gender,
      );
      Navigator.pop(context); // 페이지 닫기
    } catch (e) {
      // 오류 처리 (예: 에러 메시지 표시)
      print('회원가입 오류: $e');
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    nicknameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: '회원가입',
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // 로고 이미지
                        Image.asset(
                          'assets/LAXY_highqual_logo.png', // 로고 이미지 경로
                          width: 70,
                          height: 70,
                        ),
                        const SizedBox(width: 10,),
                        // 로고
                        const Text(
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
                          SizedBox(height: 10),
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
                          SizedBox(height: 10),
                          // 닉네임 입력 필드
                          CustomTextField(
                            key: nicknameKey,
                            controller: nicknameController,
                            labelText: '닉네임',
                          ),
                          SizedBox(height: 10),
                          // 생년월일 버튼
                          TextListTile(
                            onPressed: () async {
                              final DateTime? dateTime = await showDatePicker(
                                context: context,
                                initialDate: DateTime(2002-1-1),
                                firstDate: DateTime(1900),
                                locale: const Locale('ko', 'KR'),
                                builder: (BuildContext context, Widget? child) {
                                  return Theme(
                                    data: ThemeData.light().copyWith(
                                      primaryColor: Color(0xFF5589D3),
                                      colorScheme: ColorScheme.light(
                                        primary: Color(0xFF5589D3),
                                        onPrimary: Colors.white,
                                        onSurface: Colors.black,
                                      ),
                                      buttonTheme: ButtonThemeData(
                                        textTheme: ButtonTextTheme.primary, // 버튼 텍스트 색상
                                      ),
                                    ),
                                    child: child!,
                                  );
                                },
                                lastDate: DateTime(2026));
                              if (dateTime != null) {
                                setState(() {
                                  birthday = dateTime;
                                  isBirthday = true;
                                });
                              }
                            },
                            title: isBirthday
                              ? '${birthday.year} - ${birthday.month} - ${birthday.day}'
                              : '생년월일',
                            fontColor: isBirthday
                              ? Colors.black
                              : null,
                          ),
                          // 생년월일 오류 메시지
                          Visibility(
                            visible: !isBirthdayValid,
                            child: HorizontalExpanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12, top: 5),
                                child: Text(
                                  '생년월일을 입력하세요',
                                  style: TextStyle(
                                    color: Color(0xffb00020),
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            )
                          ),
                          SizedBox(
                            height: 56,
                            // 성별 라디오 버튼
                            child: CustomRadio(
                              onChanged: (SingingCharacter? gender) {
                                setState(() {
                                  _selectedGender = gender; // CustomRadio에서 선택된 성별 값을 저장
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    // 회원가입 버튼
                    ElevatedButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xFFFFFFFF),
                        foregroundColor: Color(0xFF5589D3),
                      ),
                      onPressed: () {
                        _register();
                      },
                      child: Text('회원가입'),
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
