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
import 'package:laxy/common/const/enum.dart';
import 'package:laxy/common/layout/post_layout.dart';
import 'package:laxy/utils/auth_utils.dart';
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
  late PostDetailData postDetailData;
  int myUserId = 0;

  @override
  void initState() {
    super.initState();

    String jsonString = '''
    {
      "post": {
        "post_id": 982347,
        "user_id": 451927,
        "nickname": "개발자Mike",
        "title": "Flutter로 REST API 연동하는 법 공유합니다!",
        "tags": [
          {
            "tagId": 3765,
            "tag_name": "Flutter"
          },
          {
            "tagId": 5432,
            "tag_name": "API연동"
          },
          {
            "tagId": 8907,
            "tag_name": "개발팁"
          }
        ],
        "content": "안녕하세요! 오늘은 Flutter에서 REST API를 연동하는 방법을 공유하려고 합니다. 먼저 `http` 패키지를 사용해서 간단한 GET 요청을 보내는 방법을 알려드릴게요. 이후에는 JSON 파싱과 비동기 처리에 대한 팁도 함께 드리겠습니다. 많은 분들께 도움이 되었으면 좋겠어요!",
        "imageURL": "https://picsum.photos/500",
        "updatedAt": "2024-09-22T14:05:00.000Z",
        "isLiked": true,
        "like": 483
      },
      "comments": [
        {
          "comment_id": 125837,
          "user_id": 672394,
          "nickname": "코딩초보",
          "contents": "좋은 글 감사합니다! 혹시 비동기 처리할 때 `FutureBuilder`를 사용해야 하는 상황이 있을까요? 아니면 다른 방법도 있나요?",
          "likes": 102,
          "isLiked": true,
          "updatedAt": "2024-09-22T15:30:00.000Z"
        },
        {
          "comment_id": 392485,
          "user_id": 238472,
          "nickname": "FlutterFan",
          "contents": "저도 최근에 비슷한 작업을 했는데, `dio` 패키지를 사용해보니 더 편리하더라고요. 특히 파일 업로드나 에러 처리가 더 쉬웠어요!",
          "likes": 64,
          "isLiked": false,
          "updatedAt": "2024-09-22T16:10:00.000Z"
        },
        {
          "comment_id": 583749,
          "user_id": 912734,
          "nickname": "개발자준",
          "contents": "저는 상태 관리도 함께 사용해서 API 데이터 관리를 했는데, `provider` 패키지와 함께 사용하니 구조가 더 깔끔해지더라고요. 강추합니다! 저는 상태 관리도 함께 사용해서 API 데이터 관리를 했는데, `provider` 패키지와 함께 사용하니 구조가 더 깔끔해지더라고요. 강추합니다!",
          "likes": 89,
          "isLiked": true,
          "updatedAt": "2024-09-22T17:05:00.000Z"
        }
      ]
    }
    ''';

    // JSON 문자열을 RankData 객체로 파싱
    postDetailData = PostDetailData.fromJson(jsonDecode(jsonString));
    _checkAccessToken();
    // print(postDetailData.comments[0].userId);
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
    print("Saved comment: $comment");
  }

  @override
  void dispose() {
    print('Submitted Text: ${_commentController.text}');
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> _buildTag() {
      List<Widget> tag = [];
      for (int i = 0; i < (postDetailData.post.tags?.length ?? 0); i++) {
        tag.add(
            CustomChip(
              tagId: postDetailData.post.tags![i].tagId,
              tagName: postDetailData.post.tags![i].tagName,
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
            userId: postDetailData.comments[i].userId,
            nickname: postDetailData.comments[i].nickname,
            content: postDetailData.comments[i].contents,
            likes: postDetailData.comments[i].likes,
            isLiked: postDetailData.comments[i].isLiked,
            updatedAt: postDetailData.comments[i].updatedAt,
            isMyComment: postDetailData.comments[i].userId == myUserId,
            isMyPost: postDetailData.post.user_id == myUserId,
            isPosterComment: postDetailData.comments[i].userId == postDetailData.post.user_id,
          )
        );
      }
      return comment;
    }

    List<Menu> _buildPopupMenu() {
      List<Menu> menuItems = [Menu.viewer];
      if(postDetailData.post.user_id != myUserId) {
        menuItems.add(Menu.report);
      }
      else {
        menuItems.add(Menu.modify);
        menuItems.add(Menu.delete);
      }
      print(menuItems);
      return menuItems;
    }

    List<String> _TagToString() {
      List<String> tags = [];
      if(postDetailData.post.tags == null){
        return tags;
      }
      for (int i = 0; i < postDetailData.post.tags!.length; i++) {
        tags.add(postDetailData.post.tags![i].tagName);
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
            num: postDetailData.post.like,
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
            postId: postDetailData.post.post_id,
            title: postDetailData.post.title,
            content: postDetailData.post.content,
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
          CustomQuillReader(),
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
                  '작성자: ${postDetailData.post.nickname}',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                Spacer(),
                Text(
                  formatDate(postDetailData.post.updatedAt),
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
