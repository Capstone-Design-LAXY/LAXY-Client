import 'package:flutter/material.dart';
import 'package:laxy/common/component/background.dart';
import 'package:laxy/common/component/custom/custom_app_bar.dart';
import 'package:laxy/common/component/custom/custom_radio.dart';
import 'package:laxy/common/component/list/text_list_tile.dart';
import 'package:laxy/common/component/page_route_with_animation.dart';
import 'package:laxy/screen/my/bookmarked_screen.dart';
import 'package:laxy/screen/user/register_screen.dart';

class MyAccountEditScreen extends StatelessWidget {
  const MyAccountEditScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar(
        title: '회원정보 수정',
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
                              '닉네임',
                              style: TextStyle(
                                fontSize: 25,
                                color: Color(0xFFFFFFFF),
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Text(
                              '이메일',
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
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  textInputAction: TextInputAction.next,
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
                                    labelText: '생년',
                                    hintText: '0000',
                                    labelStyle: TextStyle(
                                      color: Color(0xFF5589D3), // labelText의 색상 설정
                                    ),
                                  ),
                                  cursorColor: Color(0xFF5589D3), // 커서 색상
                                ),
                              ),
                              SizedBox(width: 5,),
                              Expanded(
                                child: TextField(
                                  textInputAction: TextInputAction.next,
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
                                    labelText: '월',
                                    labelStyle: TextStyle(
                                      color: Color(0xFF5589D3), // labelText의 색상 설정
                                    ),
                                  ),
                                  cursorColor: Color(0xFF5589D3), // 커서 색상
                                ),
                              ),
                              SizedBox(width: 5,),
                              Expanded(
                                child: TextField(
                                  textInputAction: TextInputAction.next,
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
                                    labelText: '일',
                                    labelStyle: TextStyle(
                                      color: Color(0xFF5589D3), // labelText의 색상 설정
                                    ),
                                  ),
                                  cursorColor: Color(0xFF5589D3), // 커서 색상
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 56,
                            child: CustomRadio(
                              onChanged: (SingingCharacter? gender) {},
                            ),
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
                        // 로그인 버튼 눌렀을 때 동작
                      },
                      child: Text('정보 수정'),
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
