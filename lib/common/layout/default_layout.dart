import 'package:flutter/material.dart';
import 'package:laxy/common/component/custom_drawer.dart';

class DefaultLayout extends StatelessWidget {
  final Widget child;

  const DefaultLayout({
    required this.child,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      drawer: CustomDrawer()
    );
  }
}