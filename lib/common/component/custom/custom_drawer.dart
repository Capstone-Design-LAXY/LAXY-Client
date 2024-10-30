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
  List<Tag>? bookmarked;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async{
    isLogin = await isAccessToken();
    if (isLogin){
      recommended = await recommendedDrawer(context);
      bookmarked = await bookmarkedDrawer(context);
    }
    else {
      random = await randomDrawer(context);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (random == null && (recommended == null || bookmarked == null)) {
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

    List<Widget> _buildRecommended() {
      List<Widget> data = [];
      if(recommended == null || recommended!.isEmpty) return [CustomDrawerItem(name: '추천 없음', enableFeedback: false, onPressed: () {},)];
      for (int i = 0; i < recommended!.length; i++) {
        data.add(
            CustomDrawerItem(
              name: recommended![i].name,
              postCount: recommended![i].postCount,
              onPressed: () {
                Navigator.pop(context);
                if(recommended![i].grade <= 5){
                  PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(TagScreen(tagId: recommended![i].tagId, tagName: recommended![i].name,));
                  Navigator.push(context, pageRouteWithAnimation.slideRightToLeft());
                }
                else {
                  PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(CommunityScreen(tagId: recommended![i].tagId, tagName: recommended![i].name,));
                  Navigator.push(context, pageRouteWithAnimation.slideRightToLeft());
                }
              },
            )
        );
      }
      return data;
    }

    List<Widget> _buildBookmarked() {
      List<Widget> data = [];
      if(bookmarked == null || bookmarked!.isEmpty) return [CustomDrawerItem(name: '즐겨찾기 없음', enableFeedback: false, onPressed: () {},)];
      for (int i = 0; i < bookmarked!.length; i++) {
        data.add(
            CustomDrawerItem(
              name: bookmarked![i].name,
              postCount: bookmarked![i].postCount,
              onPressed: () {
                Navigator.pop(context);
                if(bookmarked![i].grade <= 5){
                  PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(TagScreen(tagId: bookmarked![i].tagId, tagName: bookmarked![i].name,));
                  Navigator.push(context, pageRouteWithAnimation.slideRightToLeft());
                }
                else {
                  PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(CommunityScreen(tagId: bookmarked![i].tagId, tagName: bookmarked![i].name,));
                  Navigator.push(context, pageRouteWithAnimation.slideRightToLeft());
                }
              },
            )
        );
      }
      return data;
    }

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
              // 추천 커뮤니티
              CustomDrawerHeader(title: '추천 커뮤니티',),
              ..._buildRecommended(),
            ],
            if (!isLogin) ...[
              // 랜덤 커뮤니티
              CustomDrawerHeader(title: '추천 커뮤니티',),
              ..._buildRandom(),
            ],
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