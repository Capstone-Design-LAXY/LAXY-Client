import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:laxy/common/component/custom/custom_drawer_header.dart';
import 'package:laxy/common/component/custom/custom_drawer_item.dart';
import 'package:laxy/common/component/login_button.dart';
import 'package:laxy/common/component/page_route_with_animation.dart';
import 'package:laxy/common/component/theme_switch.dart';
import 'package:laxy/common/var.dart';
import 'package:laxy/screen/my/bookmarked_screen.dart';
import 'package:laxy/screen/my/liked_screen.dart';
import 'package:laxy/screen/my/my_page_screen.dart';
import 'package:laxy/screen/my/my_post_screen.dart';
import 'package:laxy/screen/tag/community_screen.dart';
import 'package:laxy/screen/tag/tag_screen.dart';
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
    // DrawerData 객체 생성
    drawerData = customDrawerData;
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
                if(drawerData.bookmarked[i].grade! <= 5){
                  PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(TagScreen(tagId: drawerData.bookmarked[i].tagId, tagName: drawerData.bookmarked[i].tagName,));
                  Navigator.push(context, pageRouteWithAnimation.slideRitghtToLeft());
                }
                else {
                  PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(CommunityScreen(tagId: drawerData.bookmarked[i].tagId, tagName: drawerData.bookmarked[i].tagName,));
                  Navigator.push(context, pageRouteWithAnimation.slideRitghtToLeft());
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
              name: drawerData.recommended[i].tagName,
              posts: drawerData.recommended[i].count,
              onPressed: () {
                Navigator.pop(context);
                if(drawerData.bookmarked[i].grade! <= 5){
                  PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(TagScreen(tagId: drawerData.bookmarked[i].tagId, tagName: drawerData.bookmarked[i].tagName,));
                  Navigator.push(context, pageRouteWithAnimation.slideRitghtToLeft());
                }
                else {
                  PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(CommunityScreen(tagId: drawerData.bookmarked[i].tagId, tagName: drawerData.bookmarked[i].tagName,));
                  Navigator.push(context, pageRouteWithAnimation.slideRitghtToLeft());
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