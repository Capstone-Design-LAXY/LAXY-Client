import 'package:flutter/material.dart';
import 'package:laxy/common/component/page_route_with_animation.dart';

import '../../../screen/main/mindmap_screen.dart';
import '../../../screen/main/trends_screen.dart';

class CustomSegmentButton extends StatefulWidget {
  final bool initTrends;

  const CustomSegmentButton({
    super.key,
    this.initTrends = true,
  });

  @override
  State<CustomSegmentButton> createState() => _CustomSegmentButtonState();
}

// 세그먼트 버튼 리스트
enum Main{ mindMap, trends }

class _CustomSegmentButtonState extends State<CustomSegmentButton> {
  late Main mainView;

  @override
  void initState() {
    super.initState();
    // 세그먼트 값 초기화
    mainView = widget.initTrends ? Main.trends : Main.mindMap;
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'CustomSegmentButton',
      child: SegmentedButton<Main>(
        // showSelectedIcon: false,
        selectedIcon: mainView == Main.mindMap? Icon(Icons.bubble_chart_outlined) : Icon(Icons.trending_up),
        style: SegmentedButton.styleFrom(
          // TODO: 테마 지정 필요
          selectedForegroundColor: Color(0xFF141218),
          selectedBackgroundColor: Color(0xFFD4E3FF),
          foregroundColor: Color(0xFF141218),
          backgroundColor: Color(0xFF001C3A).withOpacity(0.12),
          visualDensity: VisualDensity(vertical: -1.5,),
          textStyle: TextStyle(fontSize: 12),
        ),
        segments: <ButtonSegment<Main>>[
          ButtonSegment<Main>(
            value: Main.mindMap,
            // 사이즈 맞추려고 노력했음
            label: mainView == Main.mindMap? Text('마인드맵') : SizedBox(width: 74, child: Text('마인드맵', textAlign: TextAlign.center,)),
          ),
          ButtonSegment<Main>(
            value: Main.trends,
            label: const Text('트랜드'),
          ),
        ],
        selected: <Main>{mainView},
        onSelectionChanged: (Set<Main> newSelection) {
          setState(() {
            mainView = newSelection.first;
            // 화면 전환 로직 추가
            if (mainView == Main.mindMap) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MindmapScreen()),
              );
            } else if (mainView == Main.trends) {
              PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(TrendsScreen());
              Navigator.push(context, pageRouteWithAnimation.slideBottomToTop());
            }
          });
        },
      ),
    );
  }
}
