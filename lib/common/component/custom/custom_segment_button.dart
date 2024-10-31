import 'package:flutter/material.dart';
import 'package:laxy/common/component/page_route_with_animation.dart';

import 'package:laxy/screen/main/mindmap_screen.dart';
import 'package:laxy/screen/main/trends_screen.dart';

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
    bool showSelectedIcon = MediaQuery.of(context).size.width > 380 ? true : false;

    List<ButtonSegment<Main>> mindmapButtonSegment() {

      if (MediaQuery.of(context).size.width > 380) {
        setState(() {
          showSelectedIcon = true;
        });
        if (mainView == Main.mindMap) {
          return [
            ButtonSegment<Main>(
              value: Main.mindMap,
              label: Text('마인드맵'),
            ),
            ButtonSegment<Main>(
                value: Main.trends,
                label: const Text('트랜드')
            ),
          ];
        } else {
          return [
            ButtonSegment<Main>(
              value: Main.mindMap,
              label: SizedBox(width: 74, child: Text('마인드맵', textAlign: TextAlign.center)),
            ),
            ButtonSegment<Main>(
              value: Main.trends,
              label: const Text('트랜드')
            ),
          ];
        }
      }
      else{
        setState(() {
          showSelectedIcon = false;
        });
        return [
          ButtonSegment<Main>(
              value: Main.mindMap,
              icon: Icon(Icons.bubble_chart_outlined)
          ),
          ButtonSegment<Main>(
              value: Main.trends,
              icon: Icon(Icons.trending_up)
          ),
        ];
      }
    }

    return Hero(
      tag: 'CustomSegmentButton',
      child: SegmentedButton<Main>(
        showSelectedIcon: showSelectedIcon,
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
        segments: mindmapButtonSegment(),
        selected: <Main>{mainView},
        onSelectionChanged: (Set<Main> newSelection) {
          setState(() {
            mainView = newSelection.first;
            // 화면 전환 로직 추가
            if (mainView == Main.mindMap) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MindmapScreen())
              );
            } else if (mainView == Main.trends) {
              Navigator.pushReplacement(
                context,
                PageRouteWithAnimation(TrendsScreen()).slideBottomToTop(),
              );
            }
          });
        },
      ),
    );
  }
}
