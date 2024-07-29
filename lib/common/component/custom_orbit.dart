import 'dart:js_interop';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:laxy/common/component/orbit_star.dart';

class CustomOrbit extends StatefulWidget {
  final List<Widget> orbitWidgets;
  final Widget? center;
  final bool reverse;

  const CustomOrbit({
    super.key,
    required this.orbitWidgets,
    this.center,
    this.reverse = false,
  });

  @override
  State<CustomOrbit> createState() => _CustomOrbitState();
}

class _CustomOrbitState extends State<CustomOrbit>
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
    final double r = 200; // 중심에서의 거리 (픽셀 단위로 설정)
    final int len = widget.orbitWidgets.length;
    final double angle = 2 * pi / len;

    final Widget centerWidget = widget.center ?? OrbitStar(isGlobe: true);

    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        // 궤도
        Container(
          width: 400,
          height: 400,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(200)),
            border: Border.all(
              color: Colors.white.withOpacity(0.5),
              width: 1.0,
              style: BorderStyle.solid,
            ),
          ),
        ),
        if (widget.reverse)
          RotationTransition(
            turns: Tween<double>(begin: 0.0, end: -1.0).animate(controller),
            child: centerWidget,
          )
        else
          centerWidget,
        // 공전
        for (int i = 0; i < len; i++)
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
