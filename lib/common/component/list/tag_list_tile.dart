import 'package:flutter/material.dart';
import 'package:laxy/common/component/horizontal_expanded.dart';
import 'package:laxy/common/component/list/list_info.dart';
import 'package:laxy/common/component/orbit_star.dart';
import 'package:laxy/common/component/page_route_with_animation.dart';
import 'package:laxy/screen/tag/community_screen.dart';
import 'package:laxy/screen/tag/tag_screen.dart';

class TagListTile extends StatelessWidget {
  final int? tagId;
  final String? name;
  final int? bookmarkCount;
  final int? postCount;
  final int? grade;
  final Function() onPressed;

  const TagListTile({
    this.tagId = 0,
    this.name = 'name',
    this.bookmarkCount = 110,
    this.postCount = 100,
    this.grade = 1,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: 테마 적용, onPress 연결해서 페이지 열기, 이미지 불러오기, 날짜 렌더링
    return MaterialButton(
      shape: Border(
        bottom: BorderSide(
          color:  Color(0xFF48464C).withOpacity(0.3),
          width: 1,
        )
      ),
      onPressed: onPressed,
      elevation: 0,
      padding: EdgeInsets.zero,
      child: Row(
        children: [
          // 이미지
          Container(
            height: 60,
            width: 60,
            // color: Color(0xFFD4E3FF),
            child: OrbitStar(
              grade: grade,
              tagId: tagId,
              name: name,
              onPressed:() {
                if (grade! > 5) {
                  PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(CommunityScreen(tagName: name!, tagId: tagId!,));
                  Navigator.push(context, pageRouteWithAnimation.fadeTransition());
                } else {
                  PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(TagScreen(tagName: name!, tagId: tagId!,));
                  Navigator.push(context, pageRouteWithAnimation.fadeTransition());
                }
              },
            ),
          ),
          // 내용
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HorizontalExpanded(child: Text(name!, style: TextStyle(fontSize: 16), overflow: TextOverflow.ellipsis,)),
                  SizedBox(height: 2,),
                  Row(
                    children: [
                      Spacer(),
                      ListInfo(
                        icon: Icons.bookmark,
                        num: bookmarkCount,
                      ),
                      ListInfo(
                        icon: Icons.description_outlined,
                        num: postCount,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}