import 'package:flutter/material.dart';
import 'package:laxy/common/component/background.dart';
import 'package:laxy/common/component/custom/custom_app_bar.dart';
import 'package:laxy/common/component/page_route_with_animation.dart';
import 'package:laxy/screen/user/register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: '로그인',
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
                      child: const Column(
                        children: [
                          TextField(
                            textInputAction: TextInputAction.next,
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
                              labelText: '이메일',
                              labelStyle: TextStyle(
                                color: Color(0xFF5589D3),
                              ),
                            ),
                            cursorColor: Color(0xFF5589D3),
                          ),
                          SizedBox(height: 20),
                          // 비밀번호 입력 필드
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF5589D3), // 기본 상태일 때 테두리 색상
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF5589D3), // 포커스 상태일 때 테두리 색상
                                ),
                              ),
                              labelText: '비밀번호',
                              labelStyle: TextStyle(
                                color: Color(0xFF5589D3), // labelText의 색상 설정
                              ),
                            ),
                            cursorColor: Color(0xFF5589D3), // 커서 색상
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    // 로그인 버튼
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
                          )
                        ),
                        ElevatedButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Color(0xFFFFFFFF),
                            foregroundColor: Color(0xFF5589D3),
                          ),
                          onPressed: () {
                          },
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
