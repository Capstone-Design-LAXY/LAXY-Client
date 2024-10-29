import 'package:flutter/material.dart';
import 'package:laxy/common/component/background.dart';
import 'package:laxy/common/component/custom/custom_app_bar.dart';
import 'package:laxy/common/component/custom/custom_radio.dart';
import 'package:laxy/common/component/list/text_list_tile.dart';
import 'package:laxy/common/component/page_route_with_animation.dart';
import 'package:laxy/common/component/show_dialog.dart';
import 'package:laxy/screen/my/bookmarked_screen.dart';
import 'package:laxy/screen/my/my_account_edit_screen.dart';
import 'package:laxy/screen/my/my_account_nickname_screen.dart';
import 'package:laxy/screen/my/my_account_password_screen.dart';
import 'package:laxy/screen/user/register_screen.dart';

class MyAccountScreen extends StatelessWidget {
  final String nickname;
  final String email;

  const MyAccountScreen({
    required this.email,
    required this.nickname,
    super.key
  });

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
                              nickname,
                              style: TextStyle(
                                fontSize: 25,
                                color: Color(0xFFFFFFFF),
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Text(
                              email,
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
                          TextListTile(
                            onPressed: () {
                              PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(MyAccountNicknameScreen(
                                nickname: nickname,
                                email: email,
                              ));
                              Navigator.push(context, pageRouteWithAnimation.fadeTransition());
                              },
                            title: '닉네임 변경',
                          ),
                          SizedBox(height: 15),
                          TextListTile(
                            onPressed: () {
                              PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(MyAccountPasswordScreen(
                                nickname: nickname,
                                email: email,
                              ));
                              Navigator.push(context, pageRouteWithAnimation.fadeTransition());
                            },
                            title: '비밀번호 변경',
                          ),
                          SizedBox(height: 15),
                          TextListTile(
                            onPressed: () {
                              PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(MyAccountEditScreen(
                                nickname: nickname,
                                email: email,
                              ));
                              Navigator.push(context, pageRouteWithAnimation.fadeTransition());
                            },
                            title: '성별, 나이 변경',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    // 회원 탈퇴 버튼
                    ElevatedButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xFFFF4949),
                        foregroundColor: Color(0xFFFFFFFF),
                      ),
                      onPressed: () {
                        showWithdrawalDialog(context, nickname, email);
                      },
                      child: Text('회원 탈퇴'),
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
