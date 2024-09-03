import 'package:flutter/material.dart';
import 'package:laxy/common/component/background.dart';
import 'package:laxy/common/component/orbit.dart';
import 'package:laxy/common/const/enum.dart';
import 'package:laxy/common/layout/default_layout.dart';
import 'package:laxy/common/layout/mindmap_layout.dart';
import 'package:laxy/utils/utils.dart';
import 'package:laxy/common/component/orbit_star.dart';

class MindmapDetailScreen extends StatefulWidget {
  final ParseOrbit orbit;

  const MindmapDetailScreen({
    required this.orbit,
    super.key
  });

  @override
  _MindmapDetailScreenState createState() => _MindmapDetailScreenState();
}

class _MindmapDetailScreenState extends State<MindmapDetailScreen> {

  @override
  Widget build(BuildContext context) {

    List<Widget> _buildSatellites() {
      List<Widget> satellites = [];
      for (int i = 0; i < widget.orbit.satellites.length; i++) {
        satellites.add(
            OrbitStar(
              grade: widget.orbit.satellites[i].grade,
              tagName: widget.orbit.satellites[i].tagName,
              tId: widget.orbit.satellites[i].tId,
              showName: true,
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
              rotation: true,
              type: OrbitType.primary,
              primary: OrbitStar(
                tId: widget.orbit.primary.tId,
                showName: true,
                tagName: widget.orbit.primary.tagName,
                grade: widget.orbit.primary.grade,
              ),
              satellites: _buildSatellites(),
            ),
          ),
          // FAB, 세그먼트 버튼
          MindmapLayout(),
        ],
      ),
    );
  }
}