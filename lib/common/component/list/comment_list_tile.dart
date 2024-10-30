import 'package:flutter/material.dart';
import 'package:laxy/common/component/horizontal_expanded.dart';
import 'package:laxy/common/component/show_dialog.dart';
import 'package:laxy/utils/auth_utils.dart';
import 'package:laxy/utils/http_utils.dart';
import 'package:laxy/utils/utils.dart';

class CommentListTile extends StatefulWidget {
  final int? commentId;
  final String? author;
  final DateTime? createAt;
  final int? likeCount;
  final String? contents;
  final bool? isLiked;
  final bool? isMyComment;
  final bool? isMyPost;
  final bool? isPoster;
  final VoidCallback? onPressed;

  const CommentListTile({
    this.commentId = 0,
    this.author = 'author',
    this.contents = 'contents',
    this.likeCount = 100,
    this.isLiked = false,
    this.isMyComment = false,
    this.isPoster = false,
    this.isMyPost = false,
    this.createAt,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  State<CommentListTile> createState() => _CommentListTileState();
}

class _CommentListTileState extends State<CommentListTile> {
  late bool isLiked;
  late int likeCount;
  bool isExpanded = false;
  bool isLogin = false;

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
    likeCount = widget.likeCount!;
    _checkAccessToken();
  }

  void _checkAccessToken() async{
    bool loginStatus = await isAccessToken();
    setState(() {
      isLogin = loginStatus;
    });
    // print(isLogin);
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
        print('commentId: ${widget.commentId}');
        print('contents: ${widget.contents}');
        print('isMyPost: ${widget.isMyPost}');
        print('isMyComment: ${widget.isMyComment}');
        showCommentDialog(context, widget.commentId!, widget.contents!, widget.isMyPost ?? false, widget.isMyComment!);
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
                    visible: widget.isPoster!,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 3),
                      child: Icon(Icons.edit, size: 12, color: Color(0xFF5589D3),),
                    ),
                  ),
                  Text(widget.author!, style: TextStyle(fontSize: 12, color: Color(0xFF141218).withOpacity(0.7)),),
                  Text(' ৹ ', style: TextStyle(fontSize: 12, color: Color(0xFF141218).withOpacity(0.7)),),
                  Text(formatDate(widget.createAt), style: TextStyle(fontSize: 10, color: Color(0xFF141218).withOpacity(0.7)),),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      if (isLogin){
                        if (isLiked) {
                          deleteLikeComment(context, commentId: widget.commentId!);
                          setState(() {isLiked = false; likeCount--;});
                        }
                        else {
                          likeComment(context, commentId: widget.commentId!);
                          setState(() {isLiked = true; likeCount++;});
                        }
                      }
                      else {
                        showLoginDialog(context);
                      }
                    },
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                      child: Row(
                        children: [
                          Icon(
                            isLiked && isLogin
                              ? Icons.favorite
                              : Icons.favorite_outline,
                            size: 15,
                            color: Color(0xFF001C3A),
                          ),
                          SizedBox(width: 2,),
                          SizedBox(
                              width: 23,
                              child: Text(formatNum(likeCount), style: TextStyle(fontSize: 10))
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              HorizontalExpanded(
                child: Text(
                  widget.contents!,
                  style: TextStyle(fontSize: 14, height: 1.1),
                  maxLines: isExpanded || widget.onPressed != null ? null: 3,
                  overflow: isExpanded || widget.onPressed != null ? null: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(height: 3,)
            ],
          ),
        ),
      ),
    );
  }
}