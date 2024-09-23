import 'package:flutter/material.dart';
import 'package:laxy/common/component/list/list_info.dart';
import 'package:laxy/utils/utils.dart';

class PostListTile extends StatelessWidget {
  final String title;
  final String content;
  final int comment;
  final int like;
  final String? imageURL;
  final DateTime? dateTime;
  final Function() onPressed;

  const PostListTile({
    this.title = 'title',
    this.content = 'content content content content content content content content content ',
    this.comment = 100,
    this.like = 100,
    this.imageURL,
    this.dateTime,
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(child: Text(title, style: TextStyle(fontSize: 16), overflow: TextOverflow.ellipsis,)),
                      Text(fromatDate(dateTime), style: TextStyle(fontSize: 10)),
                      SizedBox(width: 2,),
                      ListInfo(
                        icon: Icons.comment_outlined,
                        num: comment,
                      ),
                      ListInfo(
                        icon: Icons.favorite,
                        num: like,
                      ),
                    ],
                  ),
                  SizedBox(height: 2,),
                  Text(
                    content,
                    style: TextStyle(fontSize: 12),
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          ),
          if (imageURL != null)
            Container(
              height: 60,
              width: 60,
              color: Color(0xFFD4E3FF),
              child: Image(
                image: NetworkImage('$imageURL'),
                fit: BoxFit.contain,
              ),
            ),
        ],
      ),
    );
  }
}