import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? children;

  const CustomAppBar({
    this.title = 'Title',
    this.children,
    super.key
  });

  // TODO: 테마 적용
  @override
  Widget build(BuildContext context) {

    return AppBar(
      title: InkWell(
        child: Text(title),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(title),
              duration: const Duration(seconds: 5),
              // TODO: 테마 반대로 적용
              backgroundColor: Color(0xFF141218),
              showCloseIcon: true,
            ),
          );
        },
      ),
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
