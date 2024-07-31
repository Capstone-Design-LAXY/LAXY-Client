import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final List<Widget> tabs;
  final TabController? controller;

  const CustomTabBar({
    required this.tabs,
    this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: TabBar(
        tabs: tabs,
        controller: controller,
        //TODO: 테마 적용 필요
        indicatorColor: Color(0xFF001C3A),
        labelColor: Color(0xFF141218),
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorWeight: 3,
        dividerHeight: 1,
        dividerColor: Color(0xFF48464C),
        overlayColor: WidgetStatePropertyAll(Color(0xFFB6C0CD)),
        splashBorderRadius: BorderRadius.circular(80),
      ),
    );
  }
}