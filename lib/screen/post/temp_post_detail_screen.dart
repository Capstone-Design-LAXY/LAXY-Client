import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:http/http.dart';
import 'package:laxy/common/component/custom/custom_app_bar.dart';
import 'package:laxy/common/component/custom/custom_dropdown_button.dart';
import 'package:laxy/common/component/custom/custom_icon_button.dart';
import 'package:laxy/common/component/custom/custom_modal_bottom_sheet_builder.dart';
import 'package:laxy/common/component/custom/custom_popup_menu_button.dart';
import 'package:laxy/common/component/horizontal_expanded.dart';
import 'package:laxy/common/component/list/comment_list_tile.dart';
import 'package:laxy/common/component/custom/custom_chip.dart';
import 'package:laxy/common/component/quill/custom_quill_reader.dart';
import 'package:laxy/common/const/enum.dart';
import 'package:laxy/common/layout/post_layout.dart';
import 'package:laxy/utils/auth_utils.dart';
import 'package:laxy/utils/utils.dart';

class TempPostDetailScreen extends StatefulWidget {
  final int postId;
  final List<String> tagList;
  final String title;
  final List<Map<String, dynamic>> contents;

  const TempPostDetailScreen({
    required this.postId,
    required this.tagList,
    required this.title,
    required this.contents,
    super.key
  });

  @override
  State<TempPostDetailScreen> createState() => _TempPostDetailScreenState();
}

const List<String> criteriaList = <String>['인기순', '최신순', 'MY'];

class _TempPostDetailScreenState extends State<TempPostDetailScreen> {
  String dropdownValueCriteria = criteriaList.first;
  TextEditingController _commentController = TextEditingController();
  late quill.QuillController _controller;
  late PostDetailData postDetailData;
  int myUserId = 0;

  @override
  void initState() {
    super.initState();

    List<Tag> tagModelList = [];
    for (int i = 0; i < widget.tagList.length; i++){
      tagModelList.add(Tag(tagId: i, name: widget.tagList[i], grade: i));
    }
    postDetailData = PostDetailData(
      post: Post(
        postId: widget.postId,
        author: "팀LAXY",
        likeCount: 0,
        commentCount: 0,
        isLiked: false,
        title: widget.title,
        contents: widget.contents,
        tags: tagModelList),
        comments: []
      );

    _controller = quill.QuillController(
      document: quill.Document.fromJson(
          postDetailData.post.contents!
      ),
      selection: const TextSelection.collapsed(offset: 0),
    );
    _checkAccessToken();
    // for (int i = 0; i < (postDetailData.post.content?.length ?? 0); i++) {
    //   print(postDetailData.post.content?[i]);
    // }
  }

  void _checkAccessToken() async{
    int userId = await getUserId();
    setState(() {
      myUserId = userId;
    });
    // print(userId);
  }

  void _saveComment(String comment) {
    // 서버로 전송하거나 로컬에 저장하는 로직 작성
    // TODO: 연결 필요
    print("Saved comment: $comment");
  }

  @override
  void dispose() {
    // print('Submitted Text: ${_commentController.text}');
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> _buildTag() {
      List<Widget> tag = [];
      for (int i = 0; i < postDetailData.post.tags!.length; i++) {
        tag.add(
            CustomChip(
              tagId: postDetailData.post.tags![i].tagId,
              tagName: postDetailData.post.tags![i].name,
              grade: postDetailData.post.tags![i].grade!,
            )
        );
      }
      return tag;
    }

    List<Widget> _buildComment() {
      List<Widget> comment = [];
      for (int i = 0; i < postDetailData.comments.length; i++) {
        comment.add(
          CommentListTile(
            commentId: postDetailData.comments[i].commentId,
            author: postDetailData.comments[i].author,
            contents: postDetailData.comments[i].contents,
            likeCount: postDetailData.comments[i].likeCount,
            isLiked: postDetailData.comments[i].isLiked,
            createAt: postDetailData.comments[i].createdAt,
            isMyComment: postDetailData.comments[i].isMyComment,
            isMyPost: postDetailData.post.isMyPost,
            isPoster: false, //TODO: 임시
          )
        );
      }
      return comment;
    }

    List<Menu> _buildPopupMenu() {
      List<Menu> menuItems = [Menu.viewer];
      if(!postDetailData.post.isMyPost!) {
        menuItems.add(Menu.report);
      }
      else {
        menuItems.add(Menu.modify);
        menuItems.add(Menu.delete);
      }
      // print(menuItems);
      return menuItems;
    }

    List<String> _TagToString() {
      List<String> tags = [];
      if(postDetailData.post.tags == null){
        return tags;
      }
      for (int i = 0; i < postDetailData.post.tags!.length; i++) {
        tags.add(postDetailData.post.tags![i].name);
      }
      return tags;
    }

    return PostLayout(
      appBar: CustomAppBar(
        title: '게시글 상세',
        children: [
          CustomIconButton(
            icon: postDetailData.post.isLiked!
              ? Icons.favorite
              : Icons.favorite_outline,
            num: postDetailData.post.likeCount,
            onPressed: () {
              setState(() {
                postDetailData = postDetailData.toggleIsLiked();
                // TODO: 추가 동작 필요
              });
            },
          ),
          CustomIconButton(
            icon: Icons.add_comment_outlined,
            num: postDetailData.comments.length,
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return CustomModalBottomSheetBuilder(controller: _commentController,);
                },
                isScrollControlled: true,  // 스크롤이 가능하도록 설정
              ).then((_) {
                // BottomSheet가 닫힌 후 실행되는 코드
                String commentText = _commentController.text;
                // TODO: 저장할 로직 추가
                _saveComment(commentText);
                // TextEditingController 비우기
                _commentController.clear();
              });
            },
          ),
          CustomPopupMenuButton(
            menuItems: _buildPopupMenu(),
            postId: postDetailData.post.postId,
            title: postDetailData.post.title,
            content: postDetailData.post.contents,
            tags: _TagToString(),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        children: [
          HorizontalExpanded(
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF), // 하얀색 배경
                borderRadius: BorderRadius.circular(5.0), // 둥근 테두리
              ),
              child: Text(
                postDetailData.post.title,
                style: TextStyle(
                  fontSize: 16,
                  // color: Colors.blue,
                ),
              ),
            ),
          ),
          SizedBox(height: 3,),
          CustomQuillReader(content: postDetailData.post.contents!,),
          SizedBox(height: 3,),
          // 게시글 정보
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF), // 하얀색 배경
              borderRadius: BorderRadius.circular(5.0), // 둥근 테두리
            ),
            child: Row(
              children: [
                Text(
                  '작성자: ${postDetailData.post.author}',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                Spacer(),
                Text(
                  formatDate(postDetailData.post.createdAt),
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 4,),
          // 태그 헤더
          const Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 5, left: 2, right: 2),
                child: Icon(Icons.tag, color: Color(0xFF5589D3), size: 24,),
              ),
              Text(
                '태그',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w200
                ),
              ),
            ],
          ),
          // 태그 랩
          HorizontalExpanded(
            child: Wrap(
              alignment: WrapAlignment.start,
              spacing: -5,
              runSpacing: -15,
              children: _buildTag(),
            ),
          ),
          // 댓글 헤더
          Row(
            // childern을 바닥에 붙임
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 2, right: 2),
                child: Icon(Icons.comment_outlined, color: Color(0xFF5589D3), size: 24,),
              ),
              Text(
                '댓글',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w200
                ),
              ),
              Text(
                formatNum(postDetailData.comments.length),
                style: TextStyle(
                    fontSize: 12,
                ),
              ),
              Spacer(),
              CustomDropdownButton(
                items: criteriaList,
                onChanged: (String? criteriaValue) {
                  setState(() {
                    dropdownValueCriteria = criteriaValue!;
                  });
                },
                valueGender: dropdownValueCriteria
              ),
            ],
          ),
          Column(
            children: _buildComment(),
          )
        ],
      )
    );

  }
}
