import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:laxy/common/component/custom_floating_action_button.dart';
import 'package:laxy/common/layout/default_layout.dart';
import 'package:laxy/theme/custom_theme_mode.dart';
import '../common/component/custom_tab_bar.dart';

class TrendsScreen extends StatefulWidget {

  const TrendsScreen({
    super.key
  });

  @override
  _TrendsScreenState createState() => _TrendsScreenState();
}

enum Main{ mindMap, trends }

class _TrendsScreenState extends State<TrendsScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  // Set<int> selectedSegment = {1};
  Main mainView = Main.trends;

  @override
  void initState() {
    super.initState();

    controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ValueNotifier<int> currentIndex = ValueNotifier(0);
    return DefaultLayout(
      child: Stack(
        children: [
          Center(
            child: Image(
              //TODO: 테마 이미지 변경
              image: AssetImage('assets/sky.png'),
              // color: Colors.white,
              width: 1400,
              height: 1400,
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            bottom: false,
            minimum: const EdgeInsets.only(top: 40, left: 10, right: 10),
            child: Container(
              decoration: ShapeDecoration(
                //TODO: 테마 컬러 추가
                color: Color(0xFFE2E6EA),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    // 상단 FAB, segment Button 자리
                    Row(
                      children: [
                        CustomFloatingActionButton(onPressed: () {}, icon: Icons.menu),
                        Expanded(child: SizedBox(),),
                        // TODO: 컴포넌트화 필요
                        // 세그먼트 버튼 (크기 다음과 같이 고정)
                        Container(
                          width: 176,
                          height: 40,
                          child: SegmentedButton<Main>(
                            style: SegmentedButton.styleFrom(
                              // TODO: 테마 지정 필요
                              selectedForegroundColor: Color(0xFF141218),
                              selectedBackgroundColor: Color(0xFFD4E3FF),
                              foregroundColor: Color(0xFF141218),
                              backgroundColor: Color(0xFF001C3A).withOpacity(0.12),
                              visualDensity: VisualDensity(vertical: -1.5,),
                              textStyle: TextStyle(fontSize: 9)
                            ),
                            selectedIcon: mainView == Main.mindMap? Icon(Icons.bubble_chart_outlined) : Icon(Icons.trending_up),
                            segments: const <ButtonSegment<Main>>[
                              ButtonSegment<Main>(
                                value: Main.mindMap,
                                label: Text('마인드맵'),
                              ),
                              ButtonSegment<Main>(
                                value: Main.trends,
                                label: Text('트랜드'),
                              ),
                            ],
                            selected: <Main>{mainView},
                            onSelectionChanged: (Set<Main> newSelection) {
                              setState(() {
                                mainView = newSelection.first;
                              });
                            },
                          ),
                        ),
                        Expanded(child: SizedBox(),),
                        CustomFloatingActionButton(onPressed: () {}, icon: Icons.mode_outlined),
                        SizedBox(width: 13,),
                        CustomFloatingActionButton(onPressed: () {}, icon: Icons.search),
                      ],
                    ),
                    // 메인 컨텐츠 자리
                    Column(
                      children: [
                        // TODO: 컴포넌트화 필요
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: CustomTabBar(
                            controller: controller,
                            tabs: const <Widget>[
                              Tab(text: '메인',),
                              Tab(text: '커뮤니티',),
                              Tab(text: '전체',)
                            ]
                          ),
                        ),
                        // SizedBox(height: 10,),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(vertical: 10),
                        //   child: TabBarView(
                        //     controller: controller,
                        //     children: const <Widget>[
                        //       Center(
                        //         child: Text("It's cloudy here"),
                        //       ),
                        //       Center(
                        //         child: Text("It's rainy here"),
                        //       ),
                        //       Center(
                        //         child: Text("It's sunny here"),
                        //       ),
                        //     ],
                        //   ),
                        // )
                      ],
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