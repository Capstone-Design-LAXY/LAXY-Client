import 'dart:math';
import 'package:flutter/material.dart';
import 'package:laxy/common/const/enum.dart';

class Orbit extends StatefulWidget {
  final List<Widget> satellites;
  final Widget primary;
  final Function() onPressed;
  final OrbitType? type;
  final bool enableFeedback;

  const Orbit({
    required this.satellites,
    required this.primary,
    required this.onPressed,
    this.type,
    this.enableFeedback = true,
    super.key,
  });

  @override
  _OrbitState createState() => _OrbitState();
}

class _OrbitState extends State<Orbit> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.type == OrbitType.primary ? 50 : 25),  // 한 바퀴 도는 시간
    )..repeat();  // 무한 반복
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            // OrbitType.satellite일 경우에 궤도를 클릭했을 때 동작
            child: widget.enableFeedback
                ? MaterialButton(
              onPressed: widget.onPressed,
              splashColor: Color(0xFF5589D3).withOpacity(0.2), // 클릭 시 효과
              highlightColor: Color(0xFF5589D3).withOpacity(0.2), // 클릭 시 효과
            )
                : null, // type이 primary일 경우 클릭 없음
          ),
          // 중앙 행성
          Transform.scale(
              scale: widget.type == OrbitType.primary ? 0.8 : 1,
              child: widget.primary
          ),
          // 행성
          for (int i = 0; i < widget.satellites.length; i++)
            _buildPlanet(widget.satellites.length, i),
        ],
      ),
    );
  }

  Widget _buildPlanet(int len, int index) {
    double angle = (index * 2 * pi) / len; // len개의 위젯을 일정 간격으로 배치
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        // 위젯을 190 거리만큼 떨어지게 하고 공전만 적용
        return Transform.translate(
          offset: Offset(
              190 * cos(_controller.value * 2 * pi + angle),
              190 * sin(_controller.value * 2 * pi + angle)
          ),
          child: Transform.scale(
              scale: 0.6,
              child: widget.satellites[index]
          ),
        );
      },
    );
  }
}

