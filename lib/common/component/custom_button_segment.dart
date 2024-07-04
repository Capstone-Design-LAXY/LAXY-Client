import 'package:flutter/material.dart';

class CustomButtonSegment<T> extends StatelessWidget {
  final T value;
  final Widget? icon;
  final Widget? label;
  final String? text;

  const CustomButtonSegment({
    required this.value,
    this.icon,
    this.label,
    this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonSegment(
      value: value,
      icon: Icon(Icons.bubble_chart),
    );
  }
}