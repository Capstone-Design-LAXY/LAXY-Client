import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:laxy/common/component/custom/custom_app_bar.dart';
import 'package:laxy/common/component/custom/custom_popup_menu_button.dart';
import 'package:laxy/common/component/show_dialog.dart';
import 'package:laxy/screen/tag/community_good_post_tab_view.dart';
import 'package:laxy/common/component/custom/custom_tab_bar.dart';
import 'package:laxy/common/const/enum.dart';
import 'package:laxy/screen/tag/community_main_tab_view.dart';
import 'package:laxy/screen/tag/community_post_tab_view.dart';
import 'package:laxy/screen/tag/community_recommend_tab_view.dart';
import 'package:laxy/utils/auth_utils.dart';
import 'package:laxy/utils/http_utils.dart';
import 'package:laxy/utils/utils.dart';

class CommunityScreen extends StatefulWidget {
  final String tagName;
  final int tagId;

  const CommunityScreen({
    required this.tagName,
    required this.tagId,
    super.key
  });

  @override
  _CommunityScreenState createState() => _CommunityScreenState();
}


class _CommunityScreenState extends State<CommunityScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  late CommunityData communityData;
  bool isLogin = false;
  bool isBookmarked = false;


  @override
  void initState() {
    super.initState();
    controller = TabController(length: 4, vsync: this);
    _loadData();
  }

  Future<void> _loadData() async{
    isLogin = await isAccessToken();
    if(isLogin) {
      isBookmarked = await checkBookmark(context, tagId: widget.tagId);
    }
    setState(() {});
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar(
        title: widget.tagName,
        children: [
          IconButton(
            icon: Icon(
              isLogin && isBookmarked
                  ? Icons.bookmark
                  : Icons.bookmark_outline,
            ),
            onPressed: () {
              if (isLogin){
                if (isBookmarked) {
                  deleteBookmark(context, tagId: widget.tagId);
                  setState(() {isBookmarked = false;});
                }
                else {
                  addBookmark(context, tagId: widget.tagId);
                  setState(() {isBookmarked = true;});
                }
              }
              else {
                showLoginDialog(context);
              }
            },
          ),
          CustomPopupMenuButton(
            menuItems: [Menu.report],
            tagId: widget.tagId,
          ),
          const SizedBox(width: 4,)
        ],
      ),
      body: Container(
        color: Color(0xFFE2E6EA),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              // 탭바
              CustomTabBar(
                  controller: controller,
                  tabs: const <Widget>[
                    Tab(text: '메인',),
                    Tab(text: '공감글',),
                    Tab(text: '전체',),
                    Tab(text: '추천',)
                  ]
              ),
              Expanded(
                child: TabBarView(
                  controller: controller,
                  children: [
                    CommunityMainTabView(name: widget.tagName,),
                    CommunityGoodPostTabView(name: widget.tagName,),
                    CommunityPostTabView(name: widget.tagName,),
                    CommunityRecommendTabView(tagId: widget.tagId,),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}