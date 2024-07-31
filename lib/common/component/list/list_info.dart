import 'package:flutter/material.dart';
import 'package:laxy/utils/utils.dart';

class ListInfo extends StatelessWidget {
  final IconData? icon;
  final Color? iconColor;
  final int? num;

  const ListInfo({
    this.icon = Icons.comment_outlined,
    this.iconColor = const Color(0xFF001C3A),
    this.num = 7,
    super.key
  });
  
  @override
  Widget build(BuildContext context) {
    // TODO: 테마 적용
    return Row(
      children: [
        Icon(icon, size: 15, color: iconColor,),
        SizedBox(width: 2,),
        SizedBox(
            width: 24,
            child: Text(formatNum(num), style: TextStyle(fontSize: 10))
        ),
      ],
    );
  }
}
