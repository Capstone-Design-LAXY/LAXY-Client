import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:laxy/common/component/custom_floating_action_button.dart';
import 'package:laxy/common/component/custom_segment_button.dart';
import 'package:laxy/screen/trends_community_tab_view.dart';
import 'package:laxy/screen/trends_main_tab_view.dart';
import 'package:laxy/common/layout/default_layout.dart';
import 'package:laxy/screen/trends_post_tab_view.dart';
import '../common/component/background.dart';
import '../common/component/custom_tab_bar.dart';

class TrendsScreen extends StatefulWidget {

  const TrendsScreen({
    super.key
  });

  @override
  _TrendsScreenState createState() => _TrendsScreenState();
}


class _TrendsScreenState extends State<TrendsScreen>
    with SingleTickerProviderStateMixin {
  // 탭 컨트롤러
  late TabController controller;
  // 세그먼트 값 초기화
  Main mainView = Main.trends;


  @override
  void initState() {
    super.initState();

    // 탭 컨트롤러 초기화
    controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return DefaultLayout(
      child: Stack(
        children: [
          // 배경 레이어 (하늘)
          const Background(),
          SafeArea(
            bottom: false,
            minimum: const EdgeInsets.only(top: 40, left: 10, right: 10),
            // 메인 시트
            child: Container(
              decoration: const ShapeDecoration(
                //TODO: 테마 컬러 추가
                color: Color(0xFFE2E6EA),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
              ),
              // 메인 시트 위에(Stack) 표시될 내용
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    // 상단 FAB, 세그먼트 버튼
                    Row(
                      children: [
                        // 드로워 버튼 (트로워 열기위해 Builder위젯 사용)
                        Hero(
                          tag: 'Drawer',
                          child: Builder(
                            builder: (context) {
                              return CustomFloatingActionButton(
                                onPressed: () {Scaffold.of(context).openDrawer();},
                                icon: Icons.menu
                              );
                            }
                          ),
                        ),
                        const Spacer(),
                        const CustomSegmentButton(),
                        const Spacer(),
                        // TODO: 게시글 작성 버튼 연결
                        Hero(
                          tag: 'PostRegister',
                          child: CustomFloatingActionButton(
                            icon: Icons.mode_outlined,
                            onPressed: () {print('post_register');},
                          ),
                        ),
                        const SizedBox(width: 13,),
                        // TODO: 검색 버튼 연결
                        Hero(
                          tag: 'Search',
                          child: CustomFloatingActionButton(
                            icon: Icons.search,
                            onPressed: () {print('search');},
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6,),
                    // 탭바
                    CustomTabBar(
                        controller: controller,
                        tabs: const <Widget>[
                          Tab(text: '메인',),
                          Tab(text: '커뮤니티',),
                          Tab(text: '전체',)
                        ]
                    ),
                    // 메인 컨텐츠 자리
                    Expanded(
                      child: TabBarView(
                        controller: controller,
                        children: const <Widget>[
                          TrendsMainTabView(),
                          TrendsCommunityTabView(),
                          TrendsPostTabView(),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ),
          ),
        ]
      ),
    );
  }
}