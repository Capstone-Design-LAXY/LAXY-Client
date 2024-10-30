import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:laxy/common/component/custom/custom_app_bar.dart';
import 'package:laxy/common/component/custom/custom_dropdown_button.dart';
import 'package:laxy/common/component/custom/custom_icon_button.dart';
import 'package:laxy/common/component/custom/custom_modal_bottom_sheet_builder.dart';
import 'package:laxy/common/component/custom/custom_popup_menu_button.dart';
import 'package:laxy/common/component/horizontal_expanded.dart';
import 'package:laxy/common/component/list/comment_list_tile.dart';
import 'package:laxy/common/component/custom/custom_chip.dart';
import 'package:laxy/common/component/quill/custom_quill_reader.dart';
import 'package:laxy/common/component/show_dialog.dart';
import 'package:laxy/common/const/enum.dart';
import 'package:laxy/common/layout/post_layout.dart';
import 'package:laxy/utils/http_utils.dart';
import 'package:laxy/utils/utils.dart';

class PostDetailScreen extends StatefulWidget {
  final postId;

  const PostDetailScreen({
    required this.postId,
    super.key
  });

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

const List<String> criteriaList = <String>['인기순', '최신순', 'MY'];

class _PostDetailScreenState extends State<PostDetailScreen> {
  String dropdownValueCriteria = criteriaList.first;
  TextEditingController _commentController = TextEditingController();
  bool isLogin = false;
  bool isLiked = false;
  late int likeCount;
  Post? data;
  List<Comment>? comments;

  @override
  void initState() {
    super.initState();
    _loadPost();
    _loadComment('인기순');
  }

  Future<void> _loadPost() async{
    isLogin = await isAccessToken();
    data = await detailPost(context, postId: widget.postId);
    if (data != null) {
      likeCount = data!.likeCount!;
      if (isLogin) {
        isLiked = data!.isLiked ?? false;
      }
    }
    setState(() {});
  }
  
  Future<void> _loadComment(String sortBy) async{
    // sortBy 매핑
    String sortCriteria;
    switch (sortBy) {
      case '최신순':
        sortCriteria = 'recent';
        break;
      case '인기순':
        sortCriteria = 'popular';
        break;
      case 'MY':
        sortCriteria = 'recent';
        break;
      default:
        sortCriteria = 'recent'; // 기본값
    }
    comments = await postDetailComment(context, postId: widget.postId, sortBy: sortCriteria);
    // 'MY'일 경우 필터링
    if (sortBy == 'MY' && comments != null) {
      comments = comments!.where((comment) => comment.isMyComment!).toList();
    }
    setState(() {});
  }

  @override
  void dispose() {
    // print('Submitted Text: ${_commentController.text}');
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if(data == null || comments == null) {
      return Center(child: CircularProgressIndicator()); // 데이터 로드 중 로딩 인디케이터 표시
    }

    List<Widget> _buildTag() {
      List<Widget> tag = [];
      for (int i = 0; i < (data!.tags!.length); i++) {
        tag.add(
            CustomChip(
              tagId: data!.tags![i].tagId,
              tagName: data!.tags![i].name,
              grade: data!.tags![i].grade,
            )
        );
      }
      return tag;
    }

    List<Widget> _buildComment() {
      List<Widget> comment = [];
      for (int i = 0; i < comments!.length; i++) {
        comment.add(
          CommentListTile(
            commentId: comments![i].commentId,
            author: comments![i].author,
            contents: comments![i].contents,
            likeCount: comments![i].likeCount,
            isLiked: comments![i].isLiked,
            createAt: comments![i].createdAt,
            isMyComment: comments![i].isMyComment,
            isMyPost: comments![i].isMyPost,
            isPoster: comments![i].isPoster,
          )
        );
      }
      return comment;
    }

    List<Menu> _buildPopupMenu() {
      List<Menu> menuItems = [Menu.viewer];
      if(!data!.isMyPost!) {
        menuItems.add(Menu.report);
      }
      else {
        menuItems.add(Menu.modify);
        menuItems.add(Menu.delete);
      }
      return menuItems;
    }

    List<String> _TagToString() {
      List<String> tags = [];
      if(data!.tags == null){
        return tags;
      }
      for (int i = 0; i < data!.tags!.length; i++) {
        tags.add(data!.tags![i].name);
      }
      return tags;
    }

    return PostLayout(
      appBar: CustomAppBar(
        title: '게시글 상세',
        children: [
          CustomIconButton(
            icon: isLiked && isLogin
              ? Icons.favorite
              : Icons.favorite_outline,
            num: likeCount,
            onPressed: () {
              if (isLogin){
                if (isLiked) {
                  deleteLikePost(context, postId: widget.postId);
                  setState(() {isLiked = false; likeCount--;});
                }
                else {
                  likePost(context, postId: widget.postId);
                  setState(() {isLiked = true; likeCount++;});
                }
              }
              else {
                showLoginDialog(context);
              }
            },
          ),
          CustomIconButton(
            icon: Icons.add_comment_outlined,
            num: comments!.length,
            onPressed: () {
              if (isLogin){
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return CustomModalBottomSheetBuilder(controller: _commentController, postId: widget.postId,);
                  },
                  isScrollControlled: true,  // 스크롤이 가능하도록 설정
                ).then((_) {
                  // BottomSheet가 닫힌 후 실행되는 코드
                  // TextEditingController 비우기
                  _commentController.clear();
                  _loadComment('인기순');
                });
              }
              else {
                showLoginDialog(context);
              }
            },
          ),
          CustomPopupMenuButton(
            menuItems: _buildPopupMenu(),
            postId: data!.postId,
            title: data!.title,
            content: data!.contents,
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
                data!.title,
                style: TextStyle(
                  fontSize: 16,
                  // color: Colors.blue,
                ),
              ),
            ),
          ),
          SizedBox(height: 3,),
          CustomQuillReader(content: data!.contents!,),
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
                  '작성자: ${data!.author}',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                Spacer(),
                Text(
                  formatDate(data!.createdAt),
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
                formatNum(comments!.length),
                style: TextStyle(
                    fontSize: 12,
                ),
              ),
              Spacer(),
              CustomDropdownButton(
                items: criteriaList,
                onChanged: (String? criteriaValue) {
                  if (criteriaValue == 'MY'&& !isLogin){
                    showLoginDialog(context);
                  }
                  else {
                    dropdownValueCriteria = criteriaValue!;
                    _loadComment(dropdownValueCriteria);
                    setState(() {});
                  }
                },
                valueGender: dropdownValueCriteria
              ),
            ],
          ),
          Column(
            children: _buildComment(),
          ),
          if(comments!.isEmpty) Center(child: Text('댓글 없음', style: TextStyle(fontSize: 16, color: Colors.grey),),),
        ],
      )
    );

  }
}
