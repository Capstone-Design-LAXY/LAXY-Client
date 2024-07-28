import 'dart:math';
import 'package:flutter/material.dart';

class CustomOrbit extends StatefulWidget {
  final List<Widget> orbitWidgets;

  const CustomOrbit({
    super.key,
    required this.orbitWidgets
  });

  @override
  State<CustomOrbit> createState() => _CustomOrbitState();
}

class _CustomOrbitState extends State<CustomOrbit>
    with SingleTickerProviderStateMixin {

  late AnimationController controller;

  final double r = 200; // 중심에서의 거리 (픽셀 단위로 설정)

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
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        // 중심을 기준으로 궤도를 설정
        RotationTransition(
          turns: controller,
          child: Transform.translate(
            offset: Offset(r * cos(0), r * sin(0)),
            child: widget.orbitWidgets[0]
          ),
        ),
        RotationTransition(
          turns: controller,
          child: Transform.translate(
            offset: Offset(r * cos(2 * pi / 3), r * sin(2 * pi / 3)),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(65)),
                color: Colors.green,
              ),
              height: 130,
              width: 130,
            ),
          ),
        ),
        RotationTransition(
          turns: controller,
          child: Transform.translate(
            offset: Offset(r * cos(4 * pi / 3), r * sin(4 * pi / 3)),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(65)),
                color: Colors.green,
              ),
              height: 130,
              width: 130,
            ),
          ),
        ),
        // Container(
        //   child: Image(
        //     image: AssetImage('assets/globe/LAXY_globe.png'),
        //     width: 130,
        //     height: 130,
        //   ),
        // ),

        //역회전 하는 버전
        RotationTransition(
          turns: Tween<double>(begin: 0.0, end: -1.0).animate(controller),
          child: Container(
            child: Image(
              image: AssetImage('assets/globe/LAXY_globe.png'),
              width: 130,
              height: 130,
            ),
          ),
        ),

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
        )
      ],
    );
  }
}
