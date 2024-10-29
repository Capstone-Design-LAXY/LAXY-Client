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
  bool isLogin = false;

  @override
  void initState() {
    super.initState();

    String jsonString = '''
    {
      "post": {
        "post_id": 982347,
        "user_id": 451927,
        "nickname": "꼬부7I",
        "title": "[iOS 18] 새로생긴 iOS 18의 기능들 요약 정리",
        "tags": [
          {
            "tagId": 3765,
            "tag_name": "Flutter",
            "grade": 1
          },
          {
            "tagId": 5432,
            "tag_name": "API연동",
            "grade": 5
          },
          {
            "tagId": 8907,
            "tag_name": "개발팁",
            "grade": 11
          }
        ],
        "content": [
          {
            "insert": {
              "image": "https://cafeptthumb-phinf.pstatic.net/MjAyNDA5MTdfMTU0/MDAxNzI2NTE2MDg1NTk5.M_iay-1R8pS0EJ-gByASWK3uIvlzsAgwiOwe2q3Qn0kg.DwXRVt7bVLCKq-b6RdxpGVeMAMNDgvNSA5C8VC1O1eUg.JPEG/Generic-iOS-18-Feature-Real-Mock.jpg?type=w1600"
            }
          },
          {
            "insert": "\\n\\n"
          },
          {
            "insert": "iOS 18의 새로운 기능들을 정리해봤습니다.",
            "attributes": {
              "bold": true
            }
          },
          {
            "insert": "\\n\\n직접 해보면서 간단하게 "
          },
          {
            "insert": "요약정리한",
            "attributes": {
              "background": "#FFFFF59D"
            }
          },
          {
            "insert": " 것이니 참조만 해주세요~\\n\\n"
          },
          {
            "insert": {
              "image": "https://cafeptthumb-phinf.pstatic.net/MjAyNDA5MTdfNTUg/MDAxNzI2NTA4NzY0MDU2.lemsm24MuabUk8kJLYgM0OwHd6bSMdPtoSbWAP2zyYcg.Ljivq_OtVuadsoz-PTgDUHKCgvDRUl1b1UPMmNU1MW8g.PNG/%EC%95%94%ED%98%B8_%EC%95%B1%2C_%EB%B0%B0%EC%97%B4.png?type=w1600"
            },
            "attributes": {
              "style": "width: 392.72727272727275; height: 310.176; "
            }
          },
          {
            "insert": " "
          },
          {
            "insert": "ios 18 ",
            "attributes": {
              "color": "#FF1E88E5"
            }
          },
          {
            "insert": "에서는 홈화면을 자유롭게 꾸밀 수 있습니다.\\n새로운 홈화면 꾸미기"
          },
          {
            "insert": "\\n",
            "attributes": {
              "blockquote": true
            }
          },
          {
            "insert": "앱 배열 사용자화"
          },
          {
            "insert": "\\n",
            "attributes": {
              "list": "bullet"
            }
          },
          {
            "insert": "암호앱"
          },
          {
            "insert": "\\n",
            "attributes": {
              "list": "bullet"
            }
          },
          {
            "insert": "앱 색상 변경"
          },
          {
            "insert": "\\n",
            "attributes": {
              "list": "bullet"
            }
          },
          {
            "insert": "앱과 위젯을 자유롭게 변환하기"
          },
          {
            "insert": "\\n",
            "attributes": {
              "list": "bullet"
            }
          },
          {
            "insert": "잠금화면 설정 기능 선택, 액션 버튼의 기능 다양화"
          },
          {
            "insert": "\\n",
            "attributes": {
              "indent": 1,
              "list": "bullet"
            }
          },
          {
            "insert": {
              "image": "https://cafeptthumb-phinf.pstatic.net/MjAyNDA5MTdfMTI2/MDAxNzI2NTEwMDA3NDAy.0_rVzocXqv7x2VBYMFs1xVM_KXgGUX9R56lEf747YQMg.1uOPiLe74NdSdwFfYDk4aUkfW9owWj4x76_ui9ewsFUg.PNG/KakaoTalk_20240917_030630972.png?type=w1600"
            },
            "attributes": {
              "style": "width: 392.72727272727275; height: 299.2101818181818; "
            }
          },
          {
            "insert": "제어센터 기능의 다양함\\n설정 - 연결된 에어팟 선택 - 머리 제스처 켬\\n\\n끄덕끄덕🙂‍↕️ 도리도리🙂‍↔️로 걸려오는 전화를 수신 및 거부할 수 있습니다.\\n\\n"
          },
          {
            "insert": "블로그 출처",
            "attributes": {
              "link": "https://cafe.naver.com/appleiphone/8515120"
            }
          },
          {
            "insert": "\\n\\n"
          }
        ],
        "imageURL": "https://picsum.photos/500",
        "updatedAt": "2024-09-22T14:05:00.000Z",
        "isLiked": true,
        "like": 483
      },
      "comments": [
        {
          "comment_id": 125837,
          "user_id": 672394,
          "nickname": "CHUYA",
          "contents": "깔끔한 정리 감사합니다! \\n 제어센터는 이것저것 커스텀이 가능해진건 너무 좋은데 데이터칸이 사분할 된건 너무 불편해서 별로에요 ㅠ 이 부분까지 완벽하게 커스텀이 가능하면 참 좋을 것 같은데...",
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
    // for (int i = 0; i < (postDetailData.post.content?.length ?? 0); i++) {
    //   print(postDetailData.post.content?[i]);
    // }
  }


  void _checkAccessToken() async{
    int userId = await getUserId();
    bool loginStatus = await isAccessToken();
    setState(() {
      myUserId = userId;
      isLogin = loginStatus;
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
      for (int i = 0; i < (postDetailData.post.tags?.length ?? 0); i++) {
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
            name: postDetailData.comments[i].author,
            contents: postDetailData.comments[i].contents,
            likeCount: postDetailData.comments[i].likeCount,
            isLiked: postDetailData.comments[i].isLiked,
            createAt: postDetailData.comments[i].createdAt,
            isMyComment: postDetailData.comments[i].isMyComment,
            isMyPost: postDetailData.post.isMypost,
            isPoster: false, // TODO : 임시
          )
        );
      }
      return comment;
    }

    List<Menu> _buildPopupMenu() {
      List<Menu> menuItems = [Menu.viewer];
      if(!postDetailData.post.isMypost!) {
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
            icon: postDetailData.post.isLiked! && isLogin
              ? Icons.favorite
              : Icons.favorite_outline,
            num: postDetailData.post.likeCount,
            onPressed: () {
              if (isLogin){
                setState(() {
                  postDetailData = postDetailData.toggleIsLiked();
                  // TODO: 추가 동작 필요
                });
              }
              else {
                showLoginDialog(context);
              }
            },
          ),
          CustomIconButton(
            icon: Icons.add_comment_outlined,
            num: postDetailData.comments.length,
            onPressed: () {
              if (isLogin){
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
              }
              else {
                showLoginDialog(context);
              }
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
