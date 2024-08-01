import 'package:flutter/material.dart';

/// height는 부모 위젯, width는 자식 위젯에의해 결정됌
class VerticalExpanded extends StatelessWidget {
  final Widget child;
  final MainAxisAlignment mainAxisAlignment;

  const VerticalExpanded({
    required this.child,
    this.mainAxisAlignment = MainAxisAlignment.start,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: mainAxisAlignment,
      children: [Expanded(child: child)],
    );
  }
}

