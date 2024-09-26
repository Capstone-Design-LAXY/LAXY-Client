import 'package:flutter/material.dart';
import 'package:laxy/common/component/horizontal_expanded.dart';
import 'package:laxy/common/component/list/list_info.dart';
import 'package:laxy/common/component/orbit_star.dart';

class TagListTile extends StatelessWidget {
  final int tagId;
  final String tagName;
  final int bookmarked;
  final int posts;
  final int grade;

  const TagListTile({
    required this.tagId,
    this.tagName = 'tag_name',
    this.bookmarked = 110,
    this.posts = 100,
    this.grade = 5,
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
      onPressed: () {
        print('선택된 태그 번호: ${tagId}');
      },
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
            ),
          ),
          // 내용
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HorizontalExpanded(child: Text(tagName, style: TextStyle(fontSize: 16), overflow: TextOverflow.ellipsis,)),
                  SizedBox(height: 2,),
                  Row(
                    children: [
                      Spacer(),
                      ListInfo(
                        icon: Icons.bookmark,
                        num: bookmarked,
                      ),
                      ListInfo(
                        icon: Icons.description_outlined,
                        num: posts,
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