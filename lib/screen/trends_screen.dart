import 'dart:ui';

import 'package:flutter/cupertino.dart';
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
const List<String> ageList = <String>['연령', '10대', '20대', '30대', '40대', '50대', '60대'];
const List<String> genderList = <String>['성별', '남자', '여자', '기타'];

class _TrendsScreenState extends State<TrendsScreen>
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
                        Expanded(child: SizedBox(),),
                        CustomFloatingActionButton(onPressed: () {}, icon: Icons.mode_outlined),
                        SizedBox(width: 13,),
                        CustomFloatingActionButton(onPressed: () {}, icon: Icons.search),
                      ],
                    ),
                    // 탭바
                    // TODO: 컴포넌트화 필요
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: CustomTabBar(
                          controller: controller,
                          tabs: const <Widget>[
                            Tab(text: '메인',),
                            Tab(text: '커뮤니티',),
                            Tab(text: '전체',)
                          ]
                      ),
                    ),
                    // 메인 컨텐츠 자리
                    Expanded(
                      child: ListView(
                        children: [
                          // 헤더
                          Container(
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 5, left: 2, right: 2),
                                  child: Icon(Icons.local_fire_department, color: Color(0xFFFF4949), size: 30,),
                                ),
                                Text(
                                  '일간 인기 게시글',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w200
                                  ),
                                ),
                                Expanded(child: SizedBox(),),
                                // 드롭다운
                                Container(
                                    child: DropdownButton<String>(
                                      value: dropdownValueGender,
                                      icon: const Icon(Icons.expand_more, color: Color(0xFF001C3A),),
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xFF141218)
                                      ),
                                      dropdownColor: Color(0xFFFFFFFF),
                                      isDense: true,
                                      onChanged: (String? genderValue) {
                                        setState(() {
                                          dropdownValueGender = genderValue!;
                                        });
                                      },
                                      items: genderList.map<DropdownMenuItem<String>>((String genderValue) {
                                        return DropdownMenuItem<String>(
                                          value: genderValue,
                                          child: Text(genderValue),
                                        );
                                      }).toList(),
                                    )
                                ),
                                Container(
                                  child: DropdownButton<String>(
                                    value: dropdownValueAge,
                                    icon: const Icon(Icons.expand_more, color: Color(0xFF001C3A),),
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF141218)
                                    ),
                                    dropdownColor: Color(0xFFFFFFFF),
                                    isDense: true,
                                    onChanged: (String? ageValue) {
                                      setState(() {
                                        dropdownValueAge = ageValue!;
                                      });
                                    },
                                    items: ageList.map<DropdownMenuItem<String>>((String ageValue) {
                                      return DropdownMenuItem<String>(
                                        value: ageValue,
                                        child: Text(ageValue),
                                      );
                                    }).toList(),
                                  )
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 3),
                            child: Divider(height: 1, color: Color(0xFF48464C),),
                          ),
                          Column(
                            children: <Widget>[
                              Card(
                                child: ListTile(
                                  title: Text('Title'),
                                  onTap: () {},
                                ),
                              ),
                              MaterialButton(
                                onPressed: () {},
                                child: Container(
                                  color: Colors.amber,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 20,
                                        width: 20,
                                        child: Text('1'),
                                      ),
                                      Text('아 배고파'),
                                      Expanded(child: SizedBox()),
                                      Icon(Icons.comment),

                                    ],
                                  ),
                                ),
                              )
                            ],
                          )
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