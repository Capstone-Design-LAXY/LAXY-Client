import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:laxy/common/component/custom/custom_floating_action_button.dart';
import 'package:laxy/common/component/orbit.dart';
import 'package:laxy/common/component/custom/custom_segment_button.dart';
import 'package:laxy/common/layout/default_layout.dart';
import '../../common/component/background.dart';
import '../../common/component/orbit_star.dart';
import 'mindmap_detail_screen.dart';

class MindmapScreen extends StatefulWidget {

  const MindmapScreen({
    super.key
  });

  @override
  _MindmapScreenState createState() => _MindmapScreenState();
}

const List<String> ageList = <String>['연령', '10대', '20대', '30대', '40대', '50대', '60대'];
const List<String> genderList = <String>['성별', '남자', '여자', '기타'];

class _MindmapScreenState extends State<MindmapScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;
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

  void _navigateToDetail(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => MindmapDetailScreen(), // 상세 화면을 여기서 정의해야 합니다.
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ValueNotifier<int> currentIndex = ValueNotifier(0);
    return DefaultLayout(
      child: Stack(
        children: [
          Background(rotate: true,),
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
                      Spacer(),
                      // TODO: 컴포넌트화 필요
                      // 세그먼트 버튼 (크기 다음과 같이 고정)
                      Container(
                        width: 176,
                        height: 40,
                      ),
                      Spacer(),
                      // TODO: 게시글 작성 버튼 연결
                      Hero(
                        tag: 'PostRegister',
                        child: CustomFloatingActionButton(
                          icon: Icons.mode_outlined,
                          onPressed: () {print('post_register');},
                        ),
                      ),
                      SizedBox(width: 13,),
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
                  Expanded(child: SizedBox()),
                  CustomSegmentButton(initTrends: false,)
                ],
              ),
            ),
          ),

          Center(child: Orbit(
            onPressed: () {},
            orbitWidgets: [
              Transform.scale(
                scale: 0.8,
                child: Orbit(
                  onPressed: () {},
                  center_reverse: true,
                  reverse: true,
                  center: OrbitStar(
                    isCommunity: true,
                    nameTag: true,
                    name: '인공지능',
                  ),
                  orbitWidgets: [
                    OrbitStar(
                      isCommunity: true,
                      grade: 6,
                    ),
                    OrbitStar(
                      grade: 1,
                    )
                  ]
                ),
              ),
              Transform.scale(
                scale: 0.8,
                child: Orbit(
                    onPressed: () {},
                    center_reverse: true,
                    reverse: true,
                    center: OrbitStar(
                      grade: 4,
                      nameTag: true,
                      name: '소금빵',
                    ),
                    orbitWidgets: [
                      OrbitStar(
                        isCommunity: true,
                        grade: 5,
                      ),
                    ]
                ),
              ),
              Transform.scale(
                scale: 0.8,
                child: Orbit(
                    onPressed: () => _navigateToDetail(context),
                    center_reverse: true,
                    reverse: true,
                    center: OrbitStar(
                      isCommunity: true,
                      grade: 4,
                      nameTag: true,
                      name: '자격증',
                    ),
                    orbitWidgets: [
                      OrbitStar(
                        isCommunity: true,
                        grade: 2,
                      ),
                      OrbitStar(
                        isCommunity: true,
                        grade: 3,
                      ),
                      OrbitStar(
                        grade: 2,
                      ),
                      OrbitStar(
                        grade: 5,
                      ),
                    ]
                ),
              ),
            ]
          ))
        ]
      ),
    );
  }
}