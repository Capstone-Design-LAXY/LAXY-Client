import 'package:flutter/material.dart';

/// width는 부모 위젯, height는 자식 위젯에의해 결정됌
class HorizontalExpanded extends StatelessWidget {
  final Widget child;
  final MainAxisAlignment mainAxisAlignment;

  const HorizontalExpanded({
    required this.child,
    this.mainAxisAlignment = MainAxisAlignment.start,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [Expanded(child: child)],
    );
  }
}
