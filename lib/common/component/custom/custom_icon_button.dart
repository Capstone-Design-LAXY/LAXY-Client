import 'package:flutter/material.dart';
import 'package:laxy/utils/utils.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final Function() onPressed;
  final int? num;

  const CustomIconButton({
    required this.icon,
    required this.onPressed,
    this.num,
    super.key
  });



  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        IconButton(onPressed: onPressed,icon: Icon(icon)),
        Positioned(bottom: 2, child: Text(formatNum(num), style: TextStyle(fontSize: 8),)),
      ],
    );
  }
}
