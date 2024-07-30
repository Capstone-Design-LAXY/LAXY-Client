import 'package:flutter/material.dart';

class ListHeader extends StatelessWidget {
  final IconData? icon;
  final Color? iconColor;
  final String title;
  final List<Widget>? children;

  const ListHeader({
    this.icon,
    this.iconColor = const Color(0xFFFF4949),
    this.title = "title",
    this.children,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    // TODO: 테마 적용
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 5, left: 2, right: 2),
          child: icon != null
              ? Icon(icon, color: iconColor, size: 30,)
              : const SizedBox(width: 6, height: 30),
        ),
        Text(
          title,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w200
          ),
        ),
        const Spacer(),
        // children이 null이 아닌 경우 렌더링
        if (children != null) ...children!,
      ],
    );
  }
}
