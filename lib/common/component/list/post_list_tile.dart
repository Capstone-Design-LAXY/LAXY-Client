import 'package:flutter/material.dart';
import 'package:laxy/common/component/list/list_info.dart';
import 'package:laxy/utils/utils.dart';

class PostListTile extends StatelessWidget {
  final String? title;
  final String? author;
  final int? commentCount;
  final int? likeCount;
  final int? viewCount;
  final String? imageUrl;
  final DateTime? createdAt;
  final Function() onPressed;

  const PostListTile({
    this.title = 'title',
    this.author = 'author',
    this.commentCount = 100,
    this.likeCount = 100,
    this.viewCount = 100,
    this.imageUrl,
    this.createdAt,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      Expanded(child: Text(title!, style: TextStyle(fontSize: 16), overflow: TextOverflow.ellipsis,)),
                      SizedBox(width: 2,),
                    ],
                  ),
                  SizedBox(height: 2,),
                  Row(
                    children: [
                      Text(formatDate(createdAt), style: TextStyle(fontSize: 10)),
                      Text(" | "),
                      Expanded(
                        child: Text(
                          author!,
                          style: TextStyle(fontSize: 12),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(width: 2,),
                      ListInfo(
                        icon: Icons.comment_outlined,
                        num: commentCount,
                      ),
                      ListInfo(
                        icon: Icons.favorite,
                        num: likeCount,
                      ),
                      ListInfo(
                        icon: Icons.visibility_outlined,
                        num: viewCount,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          if (imageUrl != null)
            Container(
              height: 60,
              width: 60,
              color: Color(0xFFD4E3FF),
              child: Image(
                image: NetworkImage('$imageUrl'),
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
        ],
      ),
    );
  }
}