import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:laxy/common/component/custom_floating_action_button.dart';
import 'package:laxy/common/layout/default_layout.dart';
import 'package:laxy/theme/custom_theme_mode.dart';

class TrendsScreen extends StatefulWidget {

  const TrendsScreen({
    super.key
  });

  @override
  _TrendsScreenState createState() => _TrendsScreenState();
}

class _TrendsScreenState extends State<TrendsScreen> {
  Set<String> seletedSegment = {'마인드맵'};

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
              child: Column(
                children: [
                  // 상단 FAB, segment Button 자리
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        CustomFloatingActionButton(onPressed: () {}, icon: Icons.menu),
                        Expanded(child: SizedBox(),),
                        // 세그먼트 버튼 (크기 다음과 같이 고정)
                        Container(
                          width: 160,
                          height: 40,
                          child: SegmentedButton(
                            segments: [
                              ButtonSegment(value: '마인드맵', label: Text('마인드맵'), enabled: true),
                              ButtonSegment(value: '트랜드', label: Text('트랜드')),
                            ],
                            selected: seletedSegment
                          ),
                        ),
                        Expanded(child: SizedBox(),),
                        CustomFloatingActionButton(onPressed: () {}, icon: Icons.mode_outlined),
                        SizedBox(width: 20,),
                        CustomFloatingActionButton(onPressed: () {}, icon: Icons.search),
                      ],
                    ),
                  ),
                  // 메인 컨텐츠 자리
                  Column(
                    children: [
                      // TODO: 컴포넌트화 필요
                      // TabBar(
                      //     tabs: [
                      //       Tab(text: '메인',),
                      //       Tab(text: '커뮤니티',),
                      //       Tab(text: '전체',)
                      //     ]
                      // )
                    ],
                  )
                ],
              )
            ),
          ),
        ]
      ),
    );
  }
}