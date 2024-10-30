import 'package:flutter/material.dart';
import 'package:laxy/common/component/background.dart';
import 'package:laxy/common/component/orbit.dart';
import 'package:laxy/common/component/page_route_with_animation.dart';
import 'package:laxy/common/const/enum.dart';
import 'package:laxy/common/layout/default_layout.dart';
import 'package:laxy/common/layout/mindmap_layout.dart';
import 'package:laxy/screen/tag/community_screen.dart';
import 'package:laxy/screen/tag/tag_screen.dart';
import 'package:laxy/utils/http_utils.dart';
import 'package:laxy/utils/utils.dart';
import 'package:laxy/common/component/orbit_star.dart';

class MindmapDetailScreen extends StatefulWidget {
  final OrbitData orbit;

  const MindmapDetailScreen({
    required this.orbit,
    super.key
  });

  @override
  _MindmapDetailScreenState createState() => _MindmapDetailScreenState();
}
// TODO : 직접 추천 타고 가는 api 추가
class _MindmapDetailScreenState extends State<MindmapDetailScreen> {

  @override
  Widget build(BuildContext context) {

    List<Widget> _buildSatellites() {
      List<Widget> satellites = [];
      if (widget.orbit.satellites == null) return [];
      for (int i = 0; i < widget.orbit.satellites!.length; i++) {
        satellites.add(
            OrbitStar(
              grade: widget.orbit.satellites![i].grade,
              name: widget.orbit.satellites![i].name,
              tagId: widget.orbit.satellites![i].tagId,
              showName: true,
              onPressed: () async{
                if (widget.orbit.satellites![i].grade > 5) {
                  PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(CommunityScreen(tagName: widget.orbit.satellites![i].name, tagId: widget.orbit.satellites![i].tagId,));
                  Navigator.push(context, pageRouteWithAnimation.fadeTransition());
                } else {
                  PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(TagScreen(tagName: widget.orbit.satellites![i].name, tagId: widget.orbit.satellites![i].tagId,));
                  Navigator.push(context, pageRouteWithAnimation.fadeTransition());
                }
                await relateTag(context, originalTagId: widget.orbit.satellites![i].tagId, relatedTagId: widget.orbit.center!.tagId,);
              },
            )
        );
      }
      return satellites;
    }

    return DefaultLayout(
      child: Stack(
        children: [
          Background(rotate: true,),
          Center(
            child: Orbit(
              onPressed: () {Navigator.of(context).pop();},
              satellites: _buildSatellites(),
              type: OrbitType.primary,
              center: widget.orbit.center == null
                ? null
                : OrbitStar(
                    tagId: widget.orbit.center!.tagId,
                    showName: true,
                    name: widget.orbit.center!.name,
                    grade: widget.orbit.center!.grade,
                    onPressed: () {
                      if (widget.orbit.center!.grade > 5) {
                        PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(CommunityScreen(tagName: widget.orbit.center!.name, tagId: widget.orbit.center!.tagId,));
                        Navigator.push(context, pageRouteWithAnimation.fadeTransition());
                      } else {
                        PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(TagScreen(tagName: widget.orbit.center!.name, tagId: widget.orbit.center!.tagId,));
                        Navigator.push(context, pageRouteWithAnimation.fadeTransition());
                      }
                    },
                  ),
            ),
          ),
          // FAB, 세그먼트 버튼
          MindmapLayout(),
        ],
      ),
    );
  }
}
