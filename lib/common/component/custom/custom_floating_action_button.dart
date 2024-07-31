import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final IconData icon;
  final Function() onPressed;

  const CustomFloatingActionButton({
    required this.onPressed,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 38,
      height: 38,
      child: FloatingActionButton.small(
        //TODO: 테마 컬러 적용
        heroTag: key,
        backgroundColor: Color(0xFFD4E3FF),
        foregroundColor: Color(0xFF001C3A),
        onPressed: onPressed,
        child: Icon(icon)
      ),
    );
  }
}