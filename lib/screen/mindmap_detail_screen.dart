import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:laxy/common/component/custom_floating_action_button.dart';
import 'package:laxy/common/component/custom_orbit.dart';
import 'package:laxy/common/component/post_ranking_list_tile.dart';
import 'package:laxy/screen/trends_community_tab_view.dart';
import 'package:laxy/screen/trends_main_tab_view.dart';
import 'package:laxy/common/layout/default_layout.dart';
import 'package:laxy/screen/trends_post_tab_view.dart';
import 'package:laxy/theme/custom_theme_mode.dart';
import '../common/component/custom_tab_bar.dart';
import '../common/component/orbit_star.dart';

class MindmapDetailScreen extends StatefulWidget {

  const MindmapDetailScreen({
    super.key
  });

  @override
  _MindmapDetailScreenState createState() => _MindmapDetailScreenState();
}

enum Main{ mindMap, trends }
const List<String> ageList = <String>['연령', '10대', '20대', '30대', '40대', '50대', '60대'];
const List<String> genderList = <String>['성별', '남자', '여자', '기타'];

class _MindmapDetailScreenState extends State<MindmapDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  Main mainView = Main.trends;
  String dropdownValueAge = ageList.first;
  String dropdownValueGender = genderList.first;


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
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  // 상단 FAB, segment Button 자리
                  Row(
                    children: [
                      Builder(
                        builder: (context) {
                          return CustomFloatingActionButton(
                            onPressed: () {Scaffold.of(context).openDrawer();},
                            icon: Icons.menu
                          );
                        }
                      ),
                      Expanded(child: SizedBox(),),
                      // TODO: 컴포넌트화 필요
                      // 세그먼트 버튼 (크기 다음과 같이 고정)
                      Container(
                        width: 176,
                        height: 40,
                      ),
                      Expanded(child: SizedBox(),),
                      CustomFloatingActionButton(onPressed: () {}, icon: Icons.mode_outlined),
                      SizedBox(width: 13,),
                      CustomFloatingActionButton(onPressed: () {}, icon: Icons.search),
                    ],
                  ),
                  Expanded(child: SizedBox()),
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
                        textStyle: TextStyle(fontSize: 9),
                      ),
                      // showSelectedIcon: false,
                      selectedIcon: mainView == Main.mindMap? Icon(Icons.bubble_chart_outlined) : Icon(Icons.trending_up),
                      segments: const <ButtonSegment<Main>>[
                        ButtonSegment<Main>(
                          value: Main.mindMap,
                          label: Text('마인드맵'),
                          // icon: Icon(Icons.bubble_chart_outlined),
                        ),
                        ButtonSegment<Main>(
                          value: Main.trends,
                          label: Text('트랜드'),
                          // icon: Icon(Icons.trending_up),
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
                ],
              ),
            ),
          ),

          Center(
            child: CustomOrbit(
              onPressed: () {Navigator.of(context).pop();},
              reverse: true,
              center: OrbitStar(
                isCommunity: true,
                grade: 4,
                nameTag: true,
                name: '자격증',
              ),
              orbitWidgets: [
                OrbitStar(
                  nameTag: true,
                  isCommunity: true,
                  grade: 2,
                  name: '토익',
                ),
                OrbitStar(
                  nameTag: true,
                  isCommunity: true,
                  grade: 3,
                  name: 'Qnet',
                ),
                OrbitStar(
                  nameTag: true,
                  grade: 2,
                  name: 'SQLD',
                ),
                OrbitStar(
                  nameTag: true,
                  grade: 5,
                  name: '정처기',
                ),
              ]
            )
          )
        ]
      ),
    );
  }
}