import 'package:flutter/material.dart';
import 'package:laxy/common/component/horizontal_expanded.dart';
import 'package:laxy/common/component/show_dialog.dart';
import 'package:laxy/utils/utils.dart';

class CommentListTile extends StatefulWidget {
  final int commentId;
  final int userId;
  final String? nickname;
  final DateTime? updatedAt;
  final int? likes;
  final String? content;
  final bool? isLiked;
  final bool? isMyPost;
  final bool? isMyComment;
  final bool? isPosterComment;
  final VoidCallback? onPressed;

  const CommentListTile({
    required this.commentId,
    required this.userId,
    this.nickname = '',
    this.content = '',
    this.likes = 0,
    this.isLiked = false,
    this.isMyPost = false,
    this.isMyComment = false,
    this.isPosterComment = false,
    this.updatedAt,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  State<CommentListTile> createState() => _CommentListTileState();
}

class _CommentListTileState extends State<CommentListTile> {
  late bool isLiked;
  bool isExpanded = false;

  // 기본 onPressed 동작 정의
  void _defaultOnPressed() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  void initState() {
    super.initState();
    isLiked = widget.isLiked!;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: 테마 적용
    return MaterialButton(
      shape: Border(
        bottom: BorderSide(
          color:  Color(0xFF48464C).withOpacity(0.3),
          width: 1,
        )
      ),
      onPressed: widget.onPressed ?? _defaultOnPressed,
      onLongPress: () {
        showCommentDialog(context, widget.commentId, widget.content!, widget.isMyPost!, widget.isMyComment!);
      },
      elevation: 0,
      padding: EdgeInsets.zero,
      child: HorizontalExpanded(
        child: Padding(
          padding: const EdgeInsets.only(top: 2, bottom: 4, right: 8, left: 8),
          child: Column(
            children: [
              Row(
                children: [
                  // 작성자 아이콘
                  Visibility(
                    visible: widget.isPosterComment!,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 3),
                      child: Icon(Icons.edit, size: 12, color: Color(0xFF5589D3),),
                    ),
                  ),
                  Text(widget.nickname!, style: TextStyle(fontSize: 12, color: Color(0xFF141218).withOpacity(0.7)),),
                  Text(' ৹ ', style: TextStyle(fontSize: 12, color: Color(0xFF141218).withOpacity(0.7)),),
                  Text(formatDate(widget.updatedAt), style: TextStyle(fontSize: 10, color: Color(0xFF141218).withOpacity(0.7)),),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isLiked = !isLiked;
                        // TODO: 동작 추가 필요
                      });
                    },
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                      child: Row(
                        children: [
                          Icon(
                            isLiked
                              ? Icons.favorite
                              : Icons.favorite_outline,
                            size: 15,
                            color: Color(0xFF001C3A),
                          ),
                          SizedBox(width: 2,),
                          SizedBox(
                              width: 23,
                              child: Text(formatNum(widget.likes), style: TextStyle(fontSize: 10))
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              HorizontalExpanded(
                child: Text(
                  widget.content!,
                  style: TextStyle(fontSize: 14, height: 1.1),
                  maxLines: isExpanded? null: 3,
                  overflow: isExpanded? null: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}