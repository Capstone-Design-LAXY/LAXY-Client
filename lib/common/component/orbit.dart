import 'dart:math';
import 'package:flutter/material.dart';
import 'package:laxy/common/component/orbit_star.dart';
import 'package:laxy/common/const/enum.dart';

class Orbit extends StatefulWidget {
  final List<Widget> satellites;
  final Widget? primary;
  final bool rotation; // 가운데 행성의 역회전 -> 위성이 모두 별이면 true (Orbit이 껴있으면 Orbit 회전이 느려짐)
  final Function() onPressed;
  final OrbitType type; // primary or satellite

  const Orbit({
    super.key,
    required this.satellites,
    this.primary,
    this.rotation = false,
    required this.onPressed,
    required this.type,
  });

  @override
  State<Orbit> createState() => _OrbitState();
}

class _OrbitState extends State<Orbit>
    with SingleTickerProviderStateMixin {

  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this);
    controller.repeat(min: 0.0, max: 1.0, period: const Duration(seconds:30));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double r = 190; // 중심에서의 거리 (픽셀 단위로 설정)
    final int len = widget.satellites.length; // 위성 개수
    final double angle = 2 * pi / len;

    // primary가 null이면 지구를 사용
    final Widget primaryWidget = widget.primary ?? OrbitStar(isGlobe: true);

    return Transform.scale(
      // satellite 일때 축소
      scale: widget.type == OrbitType.satellite ? 0.8 : 1,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          // 궤도
          Container(
            width: 380,
            height: 380,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(190)),
              border: Border.all(
                color: Colors.white.withOpacity(0.5),
                width: 1.0,
                style: BorderStyle.solid,
              ),
            ),
            clipBehavior: Clip.hardEdge,
            child: widget.primary != null
              ? MaterialButton(
                  onPressed: widget.onPressed,
                  splashColor: Color(0xFF5589D3).withOpacity(0.2), // 클릭 시 효과
                  highlightColor: Color(0xFF5589D3).withOpacity(0.2), // 클릭 시 효과
                )
              : null, // type이 primary일 경우 클릭 없음
          ),
          // primary
          if (widget.type == OrbitType.satellite)
            RotationTransition(
              turns: Tween<double>(begin: 0.0, end: -1.0).animate(controller),
              child: primaryWidget,
            )
          else
            primaryWidget,
          // 위성
          for (int i = 0; i < len; i++)
            if(widget.rotation)
              // 공전
              RotationTransition(
                turns: controller,
                child: Transform.translate(
                  // 시작 위치
                  offset: Offset(r * cos(angle * i + pi / 2), r * sin(angle * i + pi / 2)),
                  // 자전
                  child: RotationTransition(
                    turns: Tween<double>(begin: 0.0, end: -1.0).animate(controller),
                    child: Transform.scale(scale: 0.6, child: widget.satellites[i])
                  )
                ),
              )
            else
              // 공전
              RotationTransition(
                turns: controller,
                child: Transform.translate(
                  // 시작 위치
                  offset: Offset(r * cos(angle * i), r * sin(angle * i)),
                  child: Transform.scale(scale: 0.6, child: widget.satellites[i])
                ),
              ),
        ],
      ),
    );
  }
}
