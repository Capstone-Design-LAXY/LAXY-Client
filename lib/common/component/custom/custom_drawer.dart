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
import 'package:laxy/utils/auth_utils.dart';
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
          {"tagId": 44327, "tag_name": "결혼", "count": 1940},
          {"tagId": 859603, "tag_name": "팩", "count": 2732},
          {"tagId": 13217, "tag_name": "감", "count": 7988},
          {"tagId": 656626, "tag_name": "색종", "count": 43766},
          {"tagId": 181591, "tag_name": "앵무", "count": 80723}
        ],
        "recommended": [
          {"tagId": 156313, "tag_name": "공기청정기", "count": 63285},
          {"tagId": 120401, "tag_name": "대중교", "count": 46609},
          {"tagId": 605716, "tag_name": "크리스마", "count": 2559411},
          {"tagId": 835111, "tag_name": "게", "count": 4186504},
          {"tagId": 282296, "tag_name": "가상화폐", "count": 6823010}
        ]
      }
    ''';
    // JSON 파싱
    Map<String, dynamic> parsedJson = jsonDecode(jsonString);
    // DrawerData 객체 생성
    drawerData = DrawerData.fromJson(parsedJson);
    _checkAccessToken();
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
              name: drawerData.bookmarked[i].tagName,
              posts: drawerData.bookmarked[i].count,
              onPressed: () {
                Navigator.pop(context);
                print(drawerData.bookmarked[i].tagId);
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
              name: drawerData.recommended[i].tagName,
              posts: drawerData.recommended[i].count,
              onPressed: () {
                Navigator.pop(context);
                print(drawerData.recommended[i].tagId);
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
                Navigator.push(context, pageRouteWithAnimation.slideRitghtToLeft());
              }),
              CustomDrawerItem(name: '좋아요한 글', onPressed: () {
                Navigator.pop(context);
                PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(LikedScreen());
                Navigator.push(context, pageRouteWithAnimation.slideRitghtToLeft());
              }),
              CustomDrawerItem(name: '내가 작성한 글', onPressed: () {
                Navigator.pop(context);
                PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(MyPostScreen());
                Navigator.push(context, pageRouteWithAnimation.slideRitghtToLeft());
              }),
              CustomDrawerItem(name: '마이페이지', onPressed: () {
                Navigator.pop(context);
                PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(MyPageScreen());
                Navigator.push(context, pageRouteWithAnimation.slideRitghtToLeft());
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