import 'package:flutter/material.dart';

class Background extends StatefulWidget {
  final bool rotate;

  const Background({
    super.key,
    this.rotate = false,
  });

  @override
  State<Background> createState() => _BackgroundState();
}

class _BackgroundState extends State<Background>
    with SingleTickerProviderStateMixin {

  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this);
    controller.repeat(min: 0.0, max: 1.0, period: const Duration(seconds: 240));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    const Widget imageWidget = OverflowBox(
      maxWidth: 1000,
      maxHeight: 1000,
      child: Image(
        // TODO: 테마 이미지 변경
        image: AssetImage('assets/sky.png'),
        width: 1000,
        height: 1000,
        fit: BoxFit.cover,
      ),
    );

    return widget.rotate
      ? RotationTransition(
          turns: Tween<double>(begin: 0.0, end: -1.0).animate(controller),
          child: imageWidget,
        )
      : imageWidget;
  }
}