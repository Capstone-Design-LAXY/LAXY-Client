import 'package:flutter/material.dart';

class CustomDrawerItem extends StatelessWidget {
  final String name;
  final int? posts;

  const CustomDrawerItem({
    this.name = 'name',
    this.posts,
    Key? key,
  }) : super(key: key);

  String formatPosts(int? posts) {
    if (posts == null) return '';
    if (posts >= 1000000) {
      return '${(posts / 1000000).toStringAsFixed(1)}M';
    } else if (posts >= 1000) {
      return '${(posts / 1000).toStringAsFixed(1)}k';
    } else {
      return posts.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: 테마 적용
    return SizedBox(
      height: 30,
      child: MaterialButton(
        onPressed: () {},
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          children: [
            Text(
              name,
              style: TextStyle(fontSize: 12),
            ),
            Expanded(child: SizedBox()),
            if (posts != null) // posts가 null이 아닌 경우에만 Text 위젯을 렌더링
              Text(
                formatPosts(posts),
                style: TextStyle(fontSize: 12),
              ),
          ],
        ),
      ),
    );
  }
}