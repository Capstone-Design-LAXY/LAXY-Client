import 'package:flutter/material.dart';
import 'package:laxy/common/component/custom/custom_app_bar.dart';
import 'package:laxy/common/component/custom/custom_popup_menu_button.dart';
import 'package:laxy/screen/tag/community_good_post_tab_view.dart';
import 'package:laxy/screen/main/trends_main_tab_view.dart';
import 'package:laxy/screen/main/trends_post_tab_view.dart';
import 'package:laxy/common/component/custom/custom_tab_bar.dart';
import 'package:laxy/common/const/enum.dart';
import 'package:laxy/screen/tag/community_main_tab_view.dart';
import 'package:laxy/screen/tag/community_post_tab_view.dart';
import 'package:laxy/screen/tag/community_recommend_tab_view.dart';

class CommunityScreen extends StatefulWidget {

  const CommunityScreen({
    super.key
  });

  @override
  _CommunityScreenState createState() => _CommunityScreenState();
}


class _CommunityScreenState extends State<CommunityScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;


  @override
  void initState() {
    super.initState();

    controller = TabController(length: 4, vsync: this);
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
        title: 'Community Title',
        children: [
          IconButton(onPressed: () {}, icon: Icon(Icons.bookmark_outline)),
          const CustomPopupMenuButton(
            menuItems: [Menu.report],
            tagId: 1231113,
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
                    CommunityMainTabView(),
                    CommunityGoodPostTabView(),
                    CommunityPostTabView(),
                    CommunityRecommendTabView(),
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