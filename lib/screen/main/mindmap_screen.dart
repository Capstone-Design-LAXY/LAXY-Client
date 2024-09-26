import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:laxy/common/component/orbit.dart';
import 'package:laxy/common/component/orbit_star.dart';
import 'package:laxy/common/component/page_route_with_animation.dart';
import 'package:laxy/common/const/enum.dart';
import 'package:laxy/common/layout/default_layout.dart';
import 'package:laxy/common/layout/mindmap_layout.dart';
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

  @override
  void initState() {
    super.initState();

    String jsonString = '{"uId": 123123123123, "orbit": [{"primary": {"tId": 10000001, "grade": 9, "tagName": "자격증"}, "satellites": [{"tId": 10000002, "grade": 5, "tagName": "정처기"}, {"tId": 10000003, "grade": 7, "tagName": "토익"}, {"tId": 10000004, "grade": 2, "tagName": "SQLD"}, {"tId": 10000005, "grade": 8, "tagName": "Qnet"}]}, {"primary": {"tId": 10000006, "grade": 6, "tagName": "인공지능"}, "satellites": [{"tId": 10000007, "grade": 11, "tagName": "GPT"}, {"tId": 10000008, "grade": 1, "tagName": "빅데이터"}]}, {"primary": {"tId": 10000009, "grade": 4, "tagName": "소금빵"}, "satellites": [{"tId": 10000010, "grade": 10, "tagName": "빵"}]}]}';

    // JSON 문자열을 OrbitData 객체로 파싱
    orbitData = OrbitData.fromJson(jsonDecode(jsonString));

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
            rotation: true,
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
          rotation: true,
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
              onPressed: () {},
              type: OrbitType.primary,
              satellites: _buildSatellites(),
              globePressed: () {
                String jsonString;
                if (orbitData.uId == 1231213){
                  jsonString = '{"uId": 123123123123, "orbit": [{"primary": {"tId": 10000001, "grade": 9, "tagName": "자격증"}, "satellites": [{"tId": 10000002, "grade": 5, "tagName": "정처기"}, {"tId": 10000003, "grade": 7, "tagName": "토익"}, {"tId": 10000004, "grade": 2, "tagName": "SQLD"}, {"tId": 10000005, "grade": 8, "tagName": "Qnet"}]}, {"primary": {"tId": 10000006, "grade": 6, "tagName": "인공지능"}, "satellites": [{"tId": 10000007, "grade": 11, "tagName": "GPT"}, {"tId": 10000008, "grade": 1, "tagName": "빅데이터"}]}, {"primary": {"tId": 10000009, "grade": 4, "tagName": "소금빵"}, "satellites": [{"tId": 10000010, "grade": 10, "tagName": "빵"}]}]}';
                }
                else {
                  jsonString = '{"uId": 1231213, "orbit": [{"primary": {"tId": 10000001, "grade": 10, "tagName": "아이폰"}, "satellites": [{"tId": 10000002, "grade": 5, "tagName": "13pro중고"}, {"tId": 10000003, "grade": 7, "tagName": "애플케어"}, {"tId": 10000004, "grade": 2, "tagName": "애플워치"}, {"tId": 10000005, "grade": 8, "tagName": "에어팟프로2"}]}, {"primary": {"tId": 10000006, "grade": 11, "tagName": "손흥민"}, "satellites": [{"tId": 10000007, "grade": 11, "tagName": "토트넘"}, {"tId": 10000008, "grade": 1, "tagName": "축구"}, {"tId": 10000008, "grade": 4, "tagName": "계약"}]}, {"primary": {"tId": 10000009, "grade": 4, "tagName": "흑백요리사"}, "satellites": [{"tId": 10000010, "grade": 10, "tagName": "백종원"}, {"tId": 10000010, "grade": 8, "tagName": "안성진"}]}]}';
                }
                setState(() {
                  // JSON 문자열을 OrbitData 객체로 파싱
                  orbitData = OrbitData.fromJson(jsonDecode(jsonString));
                });
              },
            ),
          ),
          // FAB, 세그먼트 버튼
          MindmapLayout(),
        ],
      ),
    );
  }
}
