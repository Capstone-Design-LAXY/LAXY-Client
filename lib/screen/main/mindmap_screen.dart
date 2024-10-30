import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:laxy/common/component/globe.dart';
import 'package:laxy/common/component/orbit.dart';
import 'package:laxy/common/component/orbit_star.dart';
import 'package:laxy/common/component/page_route_with_animation.dart';
import 'package:laxy/common/const/enum.dart';
import 'package:laxy/common/layout/default_layout.dart';
import 'package:laxy/common/layout/mindmap_layout.dart';
import 'package:laxy/utils/http_utils.dart';
import 'package:laxy/utils/utils.dart';
import 'package:laxy/common/component/background.dart';
import 'mindmap_detail_screen.dart';

class MindmapScreen extends StatefulWidget {
  const MindmapScreen({super.key});

  @override
  _MindmapScreenState createState() => _MindmapScreenState();
}

class _MindmapScreenState extends State<MindmapScreen> with SingleTickerProviderStateMixin {
  List<OrbitData>? data;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async{
    data = await mindmapOrbit(context);
    setState(() {});
  }

  // TODO: 테마 적용, 새로고침 기능 추가
  @override
  Widget build(BuildContext context) {
    if (data == null) {
      return Center(child: CircularProgressIndicator()); // 데이터 로드 중 로딩 인디케이터 표시
    }

    List<Widget> _buildInnerSatellites(int index) {
      List<Widget> satellites = [];
      if (data![index].satellites == null) return [];
      for (int i = 0; i < data![index].satellites!.length; i++) {
        satellites.add(
          OrbitStar(
            grade: data![index].satellites![i].grade,
            name: data![index].satellites![i].name,
            tagId: data![index].satellites![i].tagId,
          )
        );
      }
      return satellites;
    }

    List<Widget> _buildSatellites() {
      List<Widget> satellites = [];
      for (int i = 0; i < data!.length; i++) {
        satellites.add(Orbit(
          onPressed: () {
            PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(MindmapDetailScreen(orbit: data![i]));
            Navigator.push(context, pageRouteWithAnimation.fadeTransition());
          },
          center: data![i].center == null
            ? null
            : OrbitStar(
                grade: data![i].center!.grade,
                name: data![i].center!.name,
                showName: true,
                tagId: data![i].center!.tagId,
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
              center: Globe(
                onPressed: () {
                  _loadData();
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
