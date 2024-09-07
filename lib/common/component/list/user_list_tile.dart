import 'package:flutter/material.dart';
import 'package:laxy/common/component/list/list_info.dart';

class UserListTile extends StatelessWidget {
  final String? title;
  final int? bookmarked;
  final int? post;
  final int? shift;
  final int? rank;

  const UserListTile({
    this.rank = 1,
    this.title = 'nickname',
    this.bookmarked = 100,
    this.post = 100,
    this.shift,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: 테마 적용, onPress 연결해서 페이지 열기
    return SizedBox(
      height: 30,
      child: MaterialButton(
        // color: Colors.amber,
        onPressed: () {},
        elevation: 0,
        padding: EdgeInsets.zero,
        child: Row(
          children: [
            SizedBox(width: 6,),
            // 타이틀
            Expanded(child: Text('$title', overflow: TextOverflow.ellipsis,)),
            Text('24-07-05 23:31', style: TextStyle(fontSize: 10)),
            SizedBox(width: 2,),
            ListInfo(
              icon: Icons.description_outlined,
              num: post,
            ),
            ListInfo(
              icon: Icons.comment_outlined,
              num: bookmarked,
            ),
          ],
        ),
      ),
    );
  }
}