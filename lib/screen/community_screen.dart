import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:laxy/screen/community_good_post_tab_view.dart';
import 'package:laxy/screen/community_my_post_tab_view.dart';
import 'package:laxy/screen/trends_main_tab_view.dart';
import 'package:laxy/screen/trends_post_tab_view.dart';
import '../common/component/custom_tab_bar.dart';

class CommunityScreen extends StatefulWidget {

  const CommunityScreen({
    super.key
  });

  @override
  _CommunityScreenState createState() => _CommunityScreenState();
}

enum Menu { preview, share, getLink, remove, download }

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
    ValueNotifier<int> currentIndex = ValueNotifier(0);
    return Scaffold(
      appBar: AppBar(
        title: const Text('data'),
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back),),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.bookmark_outline)),
          PopupMenuButton(
              icon: const Icon(Icons.more_vert),
              onSelected: (Menu item) {},
              color: Color(0xFFFFFFFF),
              itemBuilder: (BuildContext context) =>
              <PopupMenuEntry<Menu>>[
                const PopupMenuItem<Menu>(
                  value: Menu.preview,
                  child: ListTile(
                    leading: Icon(Icons.visibility_outlined),
                    title: Text('Preview'),
                  ),
                ),
                const PopupMenuItem<Menu>(
                  value: Menu.share,
                  child: ListTile(
                    leading: Icon(Icons.share_outlined),
                    title: Text('share'),
                  ),
                ),
                const PopupMenuItem<Menu>(
                  value: Menu.getLink,
                  child: ListTile(
                    leading: Icon(Icons.link_outlined),
                    title: Text('getLink'),
                  ),
                ),
                const PopupMenuItem<Menu>(
                  value: Menu.remove,
                  child: ListTile(
                    leading: Icon(Icons.delete_outline),
                    title: Text('remove'),
                  ),
                ),
                const PopupMenuDivider(),
                const PopupMenuItem<Menu>(
                  value: Menu.download,
                  child: ListTile(
                    leading: Icon(Icons.download_outlined),
                    title: Text('download'),
                  ),
                ),
              ]
          )
        ],
        backgroundColor: Color(0xFFFFFFFF),
        foregroundColor: Color(0xFF141218),
        surfaceTintColor: Color(0xFFFFFFFF),
      ),
      body: Container(
        color: Color(0xFFE2E6EA),
        // color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              // 탭바
              // TODO: 컴포넌트화 필요
              CustomTabBar(
                  controller: controller,
                  tabs: const <Widget>[
                    Tab(text: '메인',),
                    Tab(text: '좋은 글',),
                    Tab(text: '전체',),
                    Tab(text: 'MY',)
                  ]
              ),
              Expanded(
                child: TabBarView(
                  controller: controller,
                  children: [
                    TrendsMainTabView(),
                    CommunityGoodPostTabView(),
                    TrendsPostTabView(),
                    CommunityMyPostTabView(),
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