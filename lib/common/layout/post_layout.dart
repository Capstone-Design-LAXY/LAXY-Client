import 'package:flutter/material.dart';

class PostLayout extends StatelessWidget {
  final PreferredSizeWidget appBar;
  final Widget body;

  const PostLayout({
    required this.appBar,
    required this.body,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE2E6EA),
      appBar: appBar,
      body: body,
    );
  }
}
