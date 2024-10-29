import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:laxy/common/component/custom/custom_drawer_header.dart';
import 'package:laxy/common/component/custom/custom_drawer_item.dart';
import 'package:laxy/common/component/login_button.dart';
import 'package:laxy/common/component/page_route_with_animation.dart';
import 'package:laxy/common/component/theme_switch.dart';
import 'package:laxy/screen/my/bookmarked_screen.dart';
import 'package:laxy/screen/my/liked_screen.dart';
import 'package:laxy/screen/my/my_page_screen.dart';
import 'package:laxy/screen/my/my_post_screen.dart';
import 'package:laxy/screen/tag/community_screen.dart';
import 'package:laxy/screen/tag/tag_screen.dart';
import 'package:laxy/utils/auth_utils.dart';
import 'package:laxy/utils/http_utils.dart';
import 'package:laxy/utils/utils.dart';

class CustomDrawer extends StatefulWidget {

  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  late DrawerData drawerData;
  bool isLogin = false;

  @override
  void initState() {
    super.initState();
    String jsonString = '''
      {
        "bookmarked": [
          {"tagId": 44327, "name": "결혼", "postCount": 1940, "grade": 3},
          {"tagId": 859603, "name": "팩", "postCount": 2732, "grade": 5},
          {"tagId": 13217, "name": "감", "postCount": 7988, "grade": 7},
          {"tagId": 656626, "name": "색종", "postCount": 43766, "grade": 9},
          {"tagId": 181591, "name": "앵무", "postCount": 80723, "grade": 11}
        ],
        "recommended": [
          {"tagId": 156313, "name": "공기청정기", "postCount": 63285, "grade": 3},
          {"tagId": 120401, "name": "대중교통", "postCount": 46609, "grade": 5},
          {"tagId": 605716, "name": "크리스마스", "postCount": 2559411, "grade": 7},
          {"tagId": 835111, "name": "게", "postCount": 4186504, "grade": 9},
          {"tagId": 282296, "name": "가상화폐", "postCount": 6823010, "grade": 11}
        ]
      }
    ''';
    // JSON 파싱
    Map<String, dynamic> parsedJson = jsonDecode(jsonString);
    // DrawerData 객체 생성
    drawerData = DrawerData.fromJson(parsedJson);
    _checkAccessToken();
    // recommentDrawer(context);
  }

  void _checkAccessToken() async{
    bool loginStatus = await isAccessToken();
    setState(() {
      isLogin = loginStatus;
    });
    // print(isLogin);
  }



  @override
  Widget build(BuildContext context) {

    List<Widget> _buildBookmarked() {
      List<Widget> bookmarked = [];
      for (int i = 0; i < drawerData.bookmarked.length; i++) {
        bookmarked.add(
            CustomDrawerItem(
              name: drawerData.bookmarked[i].name,
              posts: drawerData.bookmarked[i].postCount,
              onPressed: () {
                Navigator.pop(context);
                if(drawerData.bookmarked[i].grade! <= 5){
                  PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(TagScreen(tagId: drawerData.bookmarked[i].tagId, tagName: drawerData.bookmarked[i].name,));
                  Navigator.push(context, pageRouteWithAnimation.slideRightToLeft());
                }
                else {
                  PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(CommunityScreen(tagId: drawerData.bookmarked[i].tagId, tagName: drawerData.bookmarked[i].name,));
                  Navigator.push(context, pageRouteWithAnimation.slideRightToLeft());
                }
              },
            )
        );
      }
      return bookmarked;
    }

    List<Widget> _buildRecommended() {
      List<Widget> recommended = [];
      for (int i = 0; i < drawerData.bookmarked.length; i++) {
        recommended.add(
            CustomDrawerItem(
              name: drawerData.recommended[i].name,
              posts: drawerData.recommended[i].postCount,
              onPressed: () {
                Navigator.pop(context);
                if(drawerData.bookmarked[i].grade! <= 5){
                  PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(TagScreen(tagId: drawerData.bookmarked[i].tagId, tagName: drawerData.bookmarked[i].name,));
                  Navigator.push(context, pageRouteWithAnimation.slideRightToLeft());
                }
                else {
                  PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(CommunityScreen(tagId: drawerData.bookmarked[i].tagId, tagName: drawerData.bookmarked[i].name,));
                  Navigator.push(context, pageRouteWithAnimation.slideRightToLeft());
                }
              },
            )
        );
      }
      return recommended;
    }

    // TODO: 테마 적용
    return Drawer(
      backgroundColor: Color(0xFFD4E3FF),
      width: 200,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 10),
            if (isLogin) ...[
              CustomDrawerHeader(title: '즐겨찾기'),
              ..._buildBookmarked(),
              Divider(),
              // 메뉴 (로그인 시 노출)
              CustomDrawerHeader(title: '메뉴'),
              CustomDrawerItem(name: '즐겨찾기한 태그', onPressed: () {
                Navigator.pop(context);
                PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(BookmarkedScreen());
                Navigator.push(context, pageRouteWithAnimation.slideRightToLeft());
              }),
              CustomDrawerItem(name: '좋아요한 글', onPressed: () {
                Navigator.pop(context);
                PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(LikedScreen());
                Navigator.push(context, pageRouteWithAnimation.slideRightToLeft());
              }),
              CustomDrawerItem(name: '내가 작성한 글', onPressed: () {
                Navigator.pop(context);
                PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(MyPostScreen());
                Navigator.push(context, pageRouteWithAnimation.slideRightToLeft());
              }),
              CustomDrawerItem(name: '마이페이지', onPressed: () {
                Navigator.pop(context);
                PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(MyPageScreen());
                Navigator.push(context, pageRouteWithAnimation.slideRightToLeft());
              }),
              // CustomDrawerItem(name: '알림', onPressed: (){}, isNew: true),
              // CustomDrawerItem(name: '설정', onPressed: (){},),
              Divider(),
            ],
            // 추천 커뮤니티
            CustomDrawerHeader(title: '추천 커뮤니티',),
            ..._buildRecommended(),
            Spacer(),
            SizedBox(
              height: 30,
              child: Row(
                children: [
                  // 로그아웃 버튼
                  LoginButton(isLogin: isLogin,),
                  Spacer(),
                  // 테마 변경 스위치
                  // ThemeSwitch(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}