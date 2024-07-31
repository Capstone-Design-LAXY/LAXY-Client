import 'dart:math';
import 'package:flutter/material.dart';
import 'package:laxy/common/component/orbit_star.dart';

class Orbit extends StatefulWidget {
  final List<Widget> orbitWidgets;
  final Widget? center;
  final bool center_reverse;
  final bool reverse;
  final Function() onPressed;

  const Orbit({
    super.key,
    required this.orbitWidgets,
    this.center,
    this.reverse = false,
    this.center_reverse = false,
    required this.onPressed,
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
    final int len = widget.orbitWidgets.length;
    final double angle = 2 * pi / len;

    final Widget centerWidget = widget.center ?? OrbitStar(isGlobe: true);

    return Stack(
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
        ),
        ClipOval(
          child: Material(
            color: Colors.transparent, // 투명한 배경
            child: InkWell(
              splashColor: Color(0xFF5589D3).withOpacity(0.2), // 클릭 시 효과
              highlightColor: Color(0xFF5589D3).withOpacity(0.2), // 클릭 시 효과
              onTap: widget.onPressed,
              child: Container(
                width: 380,
                height: 380,
              ),
            ),
          ),
        ),
        if (widget.center_reverse)
          RotationTransition(
            turns: Tween<double>(begin: 0.0, end: -1.0).animate(controller),
            child: centerWidget,
          )
        else
          centerWidget,
        // ClipOval(
        //   child: Material(
        //     color: Colors.transparent, // 투명한 배경
        //     child: InkWell(
        //       splashColor: Color(0xFF5589D3).withOpacity(0.2), // 클릭 시 효과
        //       highlightColor: Color(0xFF5589D3).withOpacity(0.2), // 클릭 시 효과
        //       onTap: widget.onPressed,
        //       child: Container(
        //         width: 400,
        //         height: 400,
        //       ),
        //     ),
        //   ),
        // ),
        // 공전
        for (int i = 0; i < len; i++)
          if(widget.reverse)
            RotationTransition(
              turns: controller,
              child: Transform.translate(
                offset: Offset(r * cos(angle * i), r * sin(angle * i)),
                child: RotationTransition(
                  turns: Tween<double>(begin: 0.0, end: -1.0).animate(controller),
                  child: Transform.scale(scale: 0.6, child: widget.orbitWidgets[i])
                )
              ),
            )
          else
            RotationTransition(
              turns: controller,
              child: Transform.translate(
                offset: Offset(r * cos(angle * i), r * sin(angle * i)),
                child: Transform.scale(scale: 0.6, child: widget.orbitWidgets[i])
              ),
            ),
      ],
    );
  }
}
