import 'package:flutter/material.dart';
import 'package:laxy/common/component/background.dart';
import 'package:laxy/common/component/custom/custom_app_bar.dart';
import 'package:laxy/common/component/custom/custom_radio.dart';
import 'package:laxy/common/component/custom/custom_text_field.dart';
import 'package:laxy/common/component/list/text_list_tile.dart';
import 'package:laxy/common/component/page_route_with_animation.dart';
import 'package:laxy/screen/main/trends_screen.dart';
import 'package:laxy/screen/my/bookmarked_screen.dart';
import 'package:laxy/screen/user/register_screen.dart';
import 'package:laxy/utils/http_utils.dart';

class MyAccountNicknameScreen extends StatefulWidget {
  final String nickname;
  final String email;

  const MyAccountNicknameScreen({
    required this.email,
    required this.nickname,
    super.key
  });

  @override
  State<MyAccountNicknameScreen> createState() => _MyAccountNicknameScreenState();
}

class _MyAccountNicknameScreenState extends State<MyAccountNicknameScreen> {
  final TextEditingController nicknameController = TextEditingController();
  final GlobalKey<CustomTextFieldState> nicknameKey = GlobalKey<CustomTextFieldState>();

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

  Future<void> _edit() async {
    if (!_isNicknameValid()) return;
    try {
      await editUser(context,
        name: nicknameController.text
      );
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => TrendsScreen()), // 홈 화면으로 이동
            (Route<dynamic> route) => false, // 모든 기존 라우트 제거
      );
    } catch (e) {
      print('회원정보수정 오류: $e');
    }
  }

  @override
  void dispose() {
    nicknameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar(
        title: '닉네임 변경',
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
                            key: nicknameKey,
                            controller: nicknameController,
                            labelText: '닉네임',
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
                      child: Text('닉네임 변경'),
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
