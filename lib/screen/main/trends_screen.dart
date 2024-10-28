import 'package:flutter/material.dart';
import 'package:laxy/common/component/custom/custom_floating_action_button.dart';
import 'package:laxy/common/component/custom/custom_search_delegate.dart';
import 'package:laxy/common/component/custom/custom_segment_button.dart';
import 'package:laxy/common/component/page_route_with_animation.dart';
import 'package:laxy/screen/post/post_register_screen.dart';
import 'package:laxy/screen/main/trends_community_tab_view.dart';
import 'package:laxy/screen/main/trends_main_tab_view.dart';
import 'package:laxy/common/layout/default_layout.dart';
import 'package:laxy/screen/main/trends_post_tab_view.dart';
import 'package:laxy/common/component/background.dart';
import 'package:laxy/common/component/custom/custom_tab_bar.dart';
import 'package:laxy/utils/auth_utils.dart';

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
  bool isLogin = false;
  // 세그먼트 값 초기화
  Main mainView = Main.trends;


  @override
  void initState() {
    super.initState();
    // 탭 컨트롤러 초기화
    controller = TabController(length: 3, vsync: this);
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
              // 메인 시트 위에 표시될 내용
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
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
                        // 세그먼트 버튼 (마인드맵 / 트랜드)
                        Visibility(visible: isLogin, child: CustomSegmentButton()),
                        const Spacer(),
                        // 게시글 작성 버튼
                        Visibility(
                          visible: isLogin,
                          child: Hero(
                            tag: 'PostRegister',
                            child: CustomFloatingActionButton(
                              icon: Icons.mode_outlined,
                              onPressed: () {
                                PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(PostRegisterScreen());
                                Navigator.push(context, pageRouteWithAnimation.slideRightToLeft());
                              },
                            ),
                          ),
                        ),
                        const SizedBox(width: 13,),
                        // 검색 버튼
                        Hero(
                          tag: 'Search',
                          child: CustomFloatingActionButton(
                            icon: Icons.search,
                            onPressed: () {
                              showSearch(
                                  context: context,
                                  delegate: CustomSearchDelegate()
                              );
                            },
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