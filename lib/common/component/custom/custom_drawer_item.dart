import 'package:flutter/material.dart';
import 'package:laxy/utils/utils.dart';

class CustomDrawerItem extends StatelessWidget {
  final String? name;
  final int? postCount;
  final Function() onPressed;
  final bool? isNew;
  final bool? enableFeedback;

  const CustomDrawerItem({
    this.name = 'name',
    this.postCount,
    required this.onPressed,
    this.isNew = false,
    this.enableFeedback = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: 테마 적용
    return SizedBox(
      height: 30,
      child: MaterialButton(
        onPressed: onPressed,
        elevation: 0,
        enableFeedback: enableFeedback!,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          children: [
            Text(
              name!,
              style: TextStyle(fontSize: 12),
            ),
            // 벳지
            if (isNew!)
              const Padding(
                padding: EdgeInsets.only(left: 5.0, top: 3),
                child: Badge(
                  backgroundColor: Color(0xFFFF4949),
                ),
              ),
            Spacer(),
            if (postCount != null) // posts가 null이 아닌 경우에만 Text 위젯을 렌더링
              Text(
                formatNum(postCount),
                style: TextStyle(fontSize: 12),
              ),
          ],
        ),
      ),
    );
  }
}