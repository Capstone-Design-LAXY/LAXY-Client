import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill_extensions/flutter_quill_extensions.dart';
import 'package:laxy/common/component/custom/custom_app_bar.dart';
import 'package:laxy/common/component/custom/custom_dropdown_button.dart';
import 'package:laxy/common/component/custom/custom_popup_menu_button.dart';
import 'package:laxy/common/component/list/comment_list_tile.dart';
import 'package:laxy/common/component/list/list_header.dart';
import 'package:laxy/common/component/list/post_list_tile.dart';
import 'package:laxy/common/component/list/tag_list_tile.dart';
import 'package:laxy/common/component/page_route_with_animation.dart';
import 'package:laxy/common/const/enum.dart';
import 'package:laxy/screen/post/post_detail_screen.dart';
import 'package:laxy/utils/http_utils.dart';
import 'package:laxy/utils/utils.dart';

class MyCommentScreen extends StatefulWidget {
  const MyCommentScreen({super.key});

  @override
  State<MyCommentScreen> createState() => _MyCommentScreenState();
}

class _MyCommentScreenState extends State<MyCommentScreen> {
  List<Comment>? data;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async{
    data = await myComment(context);
    setState(() {});
  }
  
  @override
  Widget build(BuildContext context) {
    if (data == null) {
      return Center(child: CircularProgressIndicator()); // 데이터 로드 중 로딩 인디케이터 표시
    }
    
    List<Widget> _buildComment() {
      List<Widget> comment = [];
      for (int i = 0; i < data!.length; i++) {
        comment.add(
            CommentListTile(
              commentId: data![i].commentId,
              author: data![i].author,
              contents: data![i].contents,
              likeCount: data![i].likeCount,
              isLiked: data![i].isLiked,
              createAt: data![i].createdAt,
              isMyPost: data![i].isMyPost,
              isMyComment: data![i].isMyComment,
              isPoster: data![i].isPoster,
              onPressed: () {
                PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(
                    PostDetailScreen(postId: data![i].postId,));
                Navigator.push(context, pageRouteWithAnimation.slideRightToLeft());
              },
            )
        );
      }
      return comment;
    }

    return Scaffold(
      appBar:CustomAppBar(
        title: '작성한 댓글',
      ),
      body: Container(
        color: Color(0xFFE2E6EA),
        // color: Colors.white,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Column(
                    children: _buildComment(),
                  ),
                  if(data!.isEmpty) Center(child: Text('작성한 댓글 없음', style: TextStyle(fontSize: 16, color: Colors.grey),),),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}
