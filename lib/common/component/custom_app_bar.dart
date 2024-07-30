import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? children;

  const CustomAppBar({
    this.title = 'Title',
    this.children,
    super.key
  });

  @override
  Widget build(BuildContext context) {

    return AppBar(
      title: Text(title),
      backgroundColor: const Color(0xFFFFFFFF),
      foregroundColor: const Color(0xFF141218),
      surfaceTintColor: const Color(0xFFFFFFFF),
      leading: IconButton(onPressed: () {Navigator.of(context).pop();}, icon: const Icon(Icons.arrow_back),),
      actions: children,
      titleSpacing: 1,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
