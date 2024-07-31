import 'package:flutter/material.dart';
import 'package:laxy/common/component/custom/custom_drawer.dart';
import 'package:laxy/common/component/custom/custom_floating_action_button.dart';

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
      drawer: CustomDrawer(),
    );
  }
}