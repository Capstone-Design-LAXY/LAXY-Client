import 'package:flutter/material.dart';
import 'package:laxy/common/component/page_route_with_animation.dart';
import 'package:laxy/screen/tag/community_screen.dart';
import 'package:laxy/screen/tag/tag_screen.dart';

class CustomChip extends StatelessWidget {
  final int tagId;
  final String tagName;
  final int grade;

  const CustomChip({
    required this.tagId,
    required this.tagName,
    required this.grade,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(5.0),
        child: FilterChip(
          backgroundColor: Color(0xFF5589D3),
          label: Text(
            tagName,
            style: TextStyle(color: Colors.white),
          ),
          onSelected: (value) {
            if (grade <= 5) {
              PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(
                TagScreen(tagId: tagId, tagName: tagName),
              );
              Navigator.push(context, pageRouteWithAnimation.slideRightToLeft());
            } else {
              PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(
                CommunityScreen(tagId: tagId, tagName: tagName),
              );
              Navigator.push(context, pageRouteWithAnimation.slideRightToLeft());
            }
          },
        )
    );
  }
}
