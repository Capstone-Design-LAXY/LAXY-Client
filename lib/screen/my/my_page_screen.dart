import 'package:flutter/material.dart';
import 'package:laxy/common/component/background.dart';
import 'package:laxy/common/component/custom/custom_app_bar.dart';
import 'package:laxy/common/component/list/text_list_tile.dart';
import 'package:laxy/common/component/page_route_with_animation.dart';
import 'package:laxy/screen/my/bookmarked_screen.dart';
import 'package:laxy/screen/my/liked_screen.dart';
import 'package:laxy/screen/my/my_account_screen.dart';
import 'package:laxy/screen/my/my_comment_screen.dart';
import 'package:laxy/screen/my/my_post_screen.dart';
import 'package:laxy/screen/user/register_screen.dart';

class MyPageScreen extends StatelessWidget {
  const MyPageScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar(
        title: '마이페이지',
      ),
      body: Stack(
        children: [
          Background(rotate: true,),
          // 앱의 다른 콘텐츠
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
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
                        TextListTile(
                          onPressed: () {
                            PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(BookmarkedScreen());
                            Navigator.push(context, pageRouteWithAnimation.slideRitghtToLeft());
                          },
                          title: '즐겨찾기한 태그',
                        ),
                        SizedBox(height: 15),
                        TextListTile(
                          onPressed: () {
                            PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(LikedScreen());
                            Navigator.push(context, pageRouteWithAnimation.slideRitghtToLeft());
                          },
                          title: '좋아요한 글',
                        ),
                        SizedBox(height: 15),
                        TextListTile(
                          onPressed: () {
                            PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(MyPostScreen());
                            Navigator.push(context, pageRouteWithAnimation.slideRitghtToLeft());
                          },
                          title: '작성한 글',
                        ),
                        SizedBox(height: 15),
                        TextListTile(
                          onPressed: () {
                            PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(MyCommentScreen());
                            Navigator.push(context, pageRouteWithAnimation.slideRitghtToLeft());
                            },
                          title: '작성한 댓글',
                        ),
                        SizedBox(height: 15),
                        TextListTile(
                          onPressed: () {
                            PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(MyAccountScreen());
                            Navigator.push(context, pageRouteWithAnimation.fadeTransition());
                          },
                          title: '회원정보 수정',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}