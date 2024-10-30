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
  bool isLogin = false;
  List<Tag>? random;
  List<Tag>? recommended;
  List<Tag>? my;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async{
    isLogin = await isAccessToken();
    if (isLogin){
      recommended = await randomDrawer(context);
      my = await randomDrawer(context);
    }
    else {
      random = await randomDrawer(context);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (random == null && (recommended == null || my == null)) {
      return Center(child: CircularProgressIndicator()); // 데이터 로드 중 로딩 인디케이터 표시
    }

    List<Widget> _buildRandom() {
      List<Widget> data = [];
      if(random == null || random!.isEmpty) return [CustomDrawerItem(name: '추천 없음', enableFeedback: false, onPressed: () {},)];
      for (int i = 0; i < random!.length; i++) {
        data.add(
            CustomDrawerItem(
              name: random![i].name,
              postCount: random![i].postCount,
              onPressed: () {
                Navigator.pop(context);
                if(random![i].grade <= 5){
                  PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(TagScreen(tagId: random![i].tagId, tagName: random![i].name,));
                  Navigator.push(context, pageRouteWithAnimation.slideRightToLeft());
                }
                else {
                  PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(CommunityScreen(tagId: random![i].tagId, tagName: random![i].name,));
                  Navigator.push(context, pageRouteWithAnimation.slideRightToLeft());
                }
              },
            )
        );
      }
      return data;
    }

    // List<Widget> _buildBookmarked() {
    //   List<Widget> bookmarked = [];
    //   for (int i = 0; i < drawerData.bookmarked.length; i++) {
    //     bookmarked.add(
    //         CustomDrawerItem(
    //           name: drawerData.bookmarked[i].name,
    //           postCount: drawerData.bookmarked[i].postCount,
    //           onPressed: () {
    //             Navigator.pop(context);
    //             if(drawerData.bookmarked[i].grade! <= 5){
    //               PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(TagScreen(tagId: drawerData.bookmarked[i].tagId, tagName: drawerData.bookmarked[i].name,));
    //               Navigator.push(context, pageRouteWithAnimation.slideRightToLeft());
    //             }
    //             else {
    //               PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(CommunityScreen(tagId: drawerData.bookmarked[i].tagId, tagName: drawerData.bookmarked[i].name,));
    //               Navigator.push(context, pageRouteWithAnimation.slideRightToLeft());
    //             }
    //           },
    //         )
    //     );
    //   }
    //   return bookmarked;
    // }

    // List<Widget> _buildRecommended() {
    //   List<Widget> recommended = [];
    //   for (int i = 0; i < drawerData.bookmarked.length; i++) {
    //     recommended.add(
    //         CustomDrawerItem(
    //           name: drawerData.recommended[i].name,
    //           postCount: drawerData.recommended[i].postCount,
    //           onPressed: () {
    //             Navigator.pop(context);
    //             if(drawerData.bookmarked[i].grade! <= 5){
    //               PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(TagScreen(tagId: drawerData.bookmarked[i].tagId, tagName: drawerData.bookmarked[i].name,));
    //               Navigator.push(context, pageRouteWithAnimation.slideRightToLeft());
    //             }
    //             else {
    //               PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(CommunityScreen(tagId: drawerData.bookmarked[i].tagId, tagName: drawerData.bookmarked[i].name,));
    //               Navigator.push(context, pageRouteWithAnimation.slideRightToLeft());
    //             }
    //           },
    //         )
    //     );
    //   }
    //   return recommended;
    // }

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
              // ..._buildBookmarked(),
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
              // 추천 커뮤니티
              CustomDrawerHeader(title: '추천 커뮤니티',),
              // ..._buildRecommended(),
            ],
            // 랜덤 커뮤니티
            CustomDrawerHeader(title: '추천 커뮤니티',),
            ..._buildRandom(),
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