import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:laxy/common/component/globe.dart';
import 'package:laxy/common/component/orbit.dart';
import 'package:laxy/common/component/orbit_star.dart';
import 'package:laxy/common/component/page_route_with_animation.dart';
import 'package:laxy/common/const/enum.dart';
import 'package:laxy/common/layout/default_layout.dart';
import 'package:laxy/common/layout/mindmap_layout.dart';
import 'package:laxy/common/var.dart';
import 'package:laxy/utils/utils.dart';
import 'package:laxy/common/component/background.dart';
import 'mindmap_detail_screen.dart';

class MindmapScreen extends StatefulWidget {
  const MindmapScreen({super.key});

  @override
  _MindmapScreenState createState() => _MindmapScreenState();
}

class _MindmapScreenState extends State<MindmapScreen> with SingleTickerProviderStateMixin {
  late OrbitData orbitData;
  int index = 0;

  @override
  void initState() {
    super.initState();
    orbitData = mindmapData[index];
    print(orbitData.orbit.length);
  }

  // TODO: 테마 적용, 새로고침 기능 추가
  @override
  Widget build(BuildContext context) {

    List<Widget> _buildInnerSatellites(int index) {
      List<Widget> satellites = [];
      for (int i = 0; i < orbitData.orbit[index].satellites.length; i++) {
        satellites.add(
          OrbitStar(
            grade: orbitData.orbit[index].satellites[i].grade,
            tagName: orbitData.orbit[index].satellites[i].tagName,
            tagId: orbitData.orbit[index].satellites[i].tId,
          )
        );
      }
      return satellites;
    }

    List<Widget> _buildSatellites() {
      List<Widget> satellites = [];
      for (int i = 0; i < orbitData.orbit.length; i++) {
        satellites.add(Orbit(
          onPressed: () {
            PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(MindmapDetailScreen(orbit: orbitData.orbit[i]));
            Navigator.push(context, pageRouteWithAnimation.fadeTransition());
          },
          primary: OrbitStar(
            grade: orbitData.orbit[i].primary.grade,
            tagName: orbitData.orbit[i].primary.tagName,
            showName: true,
            tagId: orbitData.orbit[i].primary.tId,
          ),
          type: OrbitType.satellite,
          satellites: _buildInnerSatellites(i),
        ));
      }
      return satellites;
    }

    return DefaultLayout(
      child: Stack(
        children: [
          Background(rotate: true,),
          Center(
            child: Orbit(
              onPressed: (){},
              enableFeedback: false,
              primary: Globe(
                onPressed: () {
                  setState(() {
                    // JSON 문자열을 OrbitData 객체로 파싱
                    if(index < mindmapData.length - 1){
                      index++;
                    }
                    else {
                      index = 0;
                    }
                    orbitData = mindmapData[index];
                  });
                },
              ),
              satellites: _buildSatellites(),
              type: OrbitType.primary,
            ),
          ),
          // FAB, 세그먼트 버튼
          MindmapLayout(),
        ],
      ),
    );
  }
}
