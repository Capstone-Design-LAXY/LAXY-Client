import 'package:flutter/material.dart';
import 'package:laxy/common/component/list/list_info.dart';
import 'package:laxy/utils/utils.dart';

class UserListTile extends StatelessWidget {
  final String? nickname;
  final int? comments;
  final int? posts;
  final DateTime? updatedAt;

  const UserListTile({
    this.nickname = 'nickname',
    this.comments = 100,
    this.posts = 100,
    this.updatedAt,
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
            Expanded(child: Text('$nickname', overflow: TextOverflow.ellipsis,)),
            Text(formatDate(updatedAt!), style: TextStyle(fontSize: 10)),
            SizedBox(width: 2,),
            ListInfo(
              icon: Icons.description_outlined,
              num: posts,
            ),
            ListInfo(
              icon: Icons.comment_outlined,
              num: comments,
            ),
          ],
        ),
      ),
    );
  }
}