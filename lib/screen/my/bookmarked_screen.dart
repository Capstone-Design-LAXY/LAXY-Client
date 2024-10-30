import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:laxy/common/component/custom/custom_app_bar.dart';
import 'package:laxy/common/component/custom/custom_dropdown_button.dart';
import 'package:laxy/common/component/custom/custom_popup_menu_button.dart';
import 'package:laxy/common/component/list/list_header.dart';
import 'package:laxy/common/component/list/post_list_tile.dart';
import 'package:laxy/common/component/list/tag_list_tile.dart';
import 'package:laxy/common/component/page_route_with_animation.dart';
import 'package:laxy/common/const/enum.dart';
import 'package:laxy/screen/tag/community_screen.dart';
import 'package:laxy/screen/tag/tag_screen.dart';
import 'package:laxy/utils/http_utils.dart';
import 'package:laxy/utils/utils.dart';

class BookmarkedScreen extends StatefulWidget {
  const BookmarkedScreen({super.key});

  @override
  State<BookmarkedScreen> createState() => _BookmarkedScreenState();
}

class _BookmarkedScreenState extends State<BookmarkedScreen> {
  List<Tag>? data;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async{
    data = await bookmarkedTag(context);
    setState(() {});
  }
  
  @override
  Widget build(BuildContext context) {
    if (data == null) {
      return Center(child: CircularProgressIndicator()); // 데이터 로드 중 로딩 인디케이터 표시
    }
    
    List<Widget> _buildTags() {
      List<Widget> tags = [];
      for (int i = 0; i < data!.length; i++) {
        tags.add(
            TagListTile(
              tagId: data![i].tagId,
              name: data![i].name,
              postCount: data![i].postCount,
              bookmarkCount: data![i].bookmarkCount,
              grade: data![i].grade,
              onPressed: () {
                if(data![i].grade <= 5){
                  PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(TagScreen(tagId: data![i].tagId, tagName: data![i].name,));
                  Navigator.push(context, pageRouteWithAnimation.slideRightToLeft());
                }
                else {
                  PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(CommunityScreen(tagId: data![i].tagId, tagName: data![i].name,));
                  Navigator.push(context, pageRouteWithAnimation.slideRightToLeft());
                }
              },
            )
        );
      }
      return tags;
    }
    return Scaffold(
      appBar:CustomAppBar(
        title: '즐겨찾기한 태그',
      ),
      body: Container(
        color: Color(0xFFE2E6EA),
        // color: Colors.white,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Column(
                    children: _buildTags(),
                  ),
                  if(data!.isEmpty) Center(child: Text('즐겨찾기한 태그 없음', style: TextStyle(fontSize: 16, color: Colors.grey),),),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}
