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
import 'package:laxy/utils/utils.dart';

class MyCommentScreen extends StatefulWidget {
  const MyCommentScreen({super.key});

  @override
  State<MyCommentScreen> createState() => _MyCommentScreenState();
}

class _MyCommentScreenState extends State<MyCommentScreen> {
  late CommentData commentData;

  @override
  void initState() {
    super.initState();
    String jsonString = '''
    {
      "comments": [
        {
          "comment_id": 10001,
          "user_id": 67601,
          "nickname": "김민수",
          "contents": "이 글 정말 유익하네요!",
          "likes": 15,
          "isLiked": false,
          "updatedAt": "2024-09-01T10:00:00.000Z"
        },
        {
          "comment_id": 10002,
          "user_id": 67602,
          "nickname": "이영희",
          "contents": "이런 내용은 처음 들어봐요.",
          "likes": 22,
          "isLiked": true,
          "updatedAt": "2024-09-02T12:30:00.000Z"
        },
        {
          "comment_id": 10003,
          "user_id": 67603,
          "nickname": "박준호",
          "contents": "좋은 정보 감사합니다!",
          "likes": 10,
          "isLiked": false,
          "updatedAt": "2024-09-03T14:15:00.000Z"
        },
        {
          "comment_id": 10004,
          "user_id": 67604,
          "nickname": "최지민",
          "contents": "실제로 해보니 더 좋은 것 같아요!",
          "likes": 5,
          "isLiked": false,
          "updatedAt": "2024-09-04T08:45:00.000Z"
        },
        {
          "comment_id": 10005,
          "user_id": 67605,
          "nickname": "정수빈",
          "contents": "다시 한번 읽어봐야겠네요.",
          "likes": 3,
          "isLiked": false,
          "updatedAt": "2024-09-05T16:20:00.000Z"
        },
        {
          "comment_id": 10006,
          "user_id": 67606,
          "nickname": "강서연",
          "contents": "추천해주셔서 감사합니다!",
          "likes": 18,
          "isLiked": true,
          "updatedAt": "2024-09-06T11:35:00.000Z"
        },
        {
          "comment_id": 10007,
          "user_id": 67607,
          "nickname": "임하준",
          "contents": "다음에도 이런 글 부탁드립니다.",
          "likes": 12,
          "isLiked": false,
          "updatedAt": "2024-09-07T09:50:00.000Z"
        },
        {
          "comment_id": 10008,
          "user_id": 67608,
          "nickname": "오세훈",
          "contents": "사실 이 주제가 꽤 중요해요.",
          "likes": 7,
          "isLiked": false,
          "updatedAt": "2024-09-08T15:20:00.000Z"
        },
        {
          "comment_id": 10009,
          "user_id": 67609,
          "nickname": "배수빈",
          "contents": "읽기 쉽고 좋네요!",
          "likes": 11,
          "isLiked": true,
          "updatedAt": "2024-09-09T17:30:00.000Z"
        },
        {
          "comment_id": 10010,
          "user_id": 67610,
          "nickname": "윤찬미",
          "contents": "내용이 더 많으면 좋겠어요.",
          "likes": 8,
          "isLiked": false,
          "updatedAt": "2024-09-10T10:10:00.000Z"
        },
        {
          "comment_id": 10011,
          "user_id": 67611,
          "nickname": "서지혜",
          "contents": "아주 도움이 되었습니다.",
          "likes": 9,
          "isLiked": false,
          "updatedAt": "2024-09-11T14:00:00.000Z"
        },
        {
          "comment_id": 10012,
          "user_id": 67612,
          "nickname": "진호",
          "contents": "내용이 마음에 드네요!",
          "likes": 4,
          "isLiked": true,
          "updatedAt": "2024-09-12T12:45:00.000Z"
        },
        {
          "comment_id": 10013,
          "user_id": 67613,
          "nickname": "장유진",
          "contents": "다음 주제는 뭐가 될까요?",
          "likes": 6,
          "isLiked": false,
          "updatedAt": "2024-09-13T11:10:00.000Z"
        },
        {
          "comment_id": 10014,
          "user_id": 67614,
          "nickname": "한상진",
          "contents": "재미있는 주제네요.",
          "likes": 5,
          "isLiked": false,
          "updatedAt": "2024-09-14T08:30:00.000Z"
        },
        {
          "comment_id": 10015,
          "user_id": 67615,
          "nickname": "송하늘",
          "contents": "좋은 글이에요!",
          "likes": 20,
          "isLiked": true,
          "updatedAt": "2024-09-15T13:15:00.000Z"
        },
        {
          "comment_id": 10016,
          "user_id": 67616,
          "nickname": "이승민",
          "contents": "이런 정보가 필요했어요.",
          "likes": 17,
          "isLiked": false,
          "updatedAt": "2024-09-16T09:50:00.000Z"
        },
        {
          "comment_id": 10017,
          "user_id": 67617,
          "nickname": "안현수",
          "contents": "한 번 더 생각해봐야겠네요.",
          "likes": 2,
          "isLiked": false,
          "updatedAt": "2024-09-17T10:45:00.000Z"
        },
        {
          "comment_id": 10018,
          "user_id": 67618,
          "nickname": "신유정",
          "contents": "정말 훌륭한 글입니다!",
          "likes": 25,
          "isLiked": true,
          "updatedAt": "2024-09-18T11:05:00.000Z"
        },
        {
          "comment_id": 10019,
          "user_id": 67619,
          "nickname": "문주희",
          "contents": "다양한 의견이 있군요.",
          "likes": 12,
          "isLiked": false,
          "updatedAt": "2024-09-19T13:25:00.000Z"
        },
        {
          "comment_id": 10020,
          "user_id": 67620,
          "nickname": "허정훈",
          "contents": "좋은 정보 감사합니다!",
          "likes": 18,
          "isLiked": false,
          "updatedAt": "2024-09-20T14:10:00.000Z"
        },
        {
          "comment_id": 10021,
          "user_id": 67621,
          "nickname": "이재현",
          "contents": "이런 주제는 항상 흥미로워요.",
          "likes": 10,
          "isLiked": true,
          "updatedAt": "2024-09-21T15:40:00.000Z"
        },
        {
          "comment_id": 10022,
          "user_id": 67622,
          "nickname": "양지수",
          "contents": "한번 더 읽어보세요!",
          "likes": 3,
          "isLiked": false,
          "updatedAt": "2024-09-22T12:00:00.000Z"
        },
        {
          "comment_id": 10023,
          "user_id": 67623,
          "nickname": "차유나",
          "contents": "참고가 많이 되었어요.",
          "likes": 14,
          "isLiked": false,
          "updatedAt": "2024-09-23T11:35:00.000Z"
        },
        {
          "comment_id": 10024,
          "user_id": 67624,
          "nickname": "조민호",
          "contents": "좋은 자료 감사합니다.",
          "likes": 8,
          "isLiked": true,
          "updatedAt": "2024-09-24T13:00:00.000Z"
        },
        {
          "comment_id": 10025,
          "user_id": 67625,
          "nickname": "원서연",
          "contents": "유익한 내용이네요!",
          "likes": 16,
          "isLiked": false,
          "updatedAt": "2024-09-25T09:15:00.000Z"
        },
        {
          "comment_id": 10026,
          "user_id": 67626,
          "nickname": "백하늘",
          "contents": "읽어보니 정말 좋습니다.",
          "likes": 11,
          "isLiked": false,
          "updatedAt": "2024-09-26T10:50:00.000Z"
        },
        {
          "comment_id": 10027,
          "user_id": 67627,
          "nickname": "이도현",
          "contents": "다양한 시각이 필요해요.",
          "likes": 7,
          "isLiked": true,
          "updatedAt": "2024-09-27T08:20:00.000Z"
        },
        {
          "comment_id": 10028,
          "user_id": 67628,
          "nickname": "윤소희",
          "contents": "아주 흥미로운 주제입니다!",
          "likes": 5,
          "isLiked": false,
          "updatedAt": "2024-09-28T15:30:00.000Z"
        },
        {
          "comment_id": 10029,
          "user_id": 67629,
          "nickname": "김다은",
          "contents": "감사합니다. 다음 글도 기대할게요.",
          "likes": 21,
          "isLiked": true,
          "updatedAt": "2024-09-29T14:40:00.000Z"
        },
        {
          "comment_id": 10030,
          "user_id": 67630,
          "nickname": "허재훈",
          "contents": "글이 너무 좋네요!",
          "likes": 9,
          "isLiked": false,
          "updatedAt": "2024-09-30T10:30:00.000Z"
        },
        {
          "comment_id": 10031,
          "user_id": 67631,
          "nickname": "강민정",
          "contents": "정말 흥미롭습니다.",
          "likes": 13,
          "isLiked": false,
          "updatedAt": "2024-10-01T12:55:00.000Z"
        },
        {
          "comment_id": 10032,
          "user_id": 67632,
          "nickname": "전진우",
          "contents": "더 많은 글 부탁드립니다!",
          "likes": 6,
          "isLiked": true,
          "updatedAt": "2024-10-02T11:25:00.000Z"
        },
        {
          "comment_id": 10033,
          "user_id": 67633,
          "nickname": "한별",
          "contents": "주제에 대한 생각을 나누고 싶어요.",
          "likes": 8,
          "isLiked": false,
          "updatedAt": "2024-10-03T14:20:00.000Z"
        },
        {
          "comment_id": 10034,
          "user_id": 67634,
          "nickname": "오하늘",
          "contents": "읽는 재미가 있네요!",
          "likes": 10,
          "isLiked": false,
          "updatedAt": "2024-10-04T09:40:00.000Z"
        },
        {
          "comment_id": 10035,
          "user_id": 67635,
          "nickname": "홍지수",
          "contents": "잘 읽었습니다. 감사해요!",
          "likes": 12,
          "isLiked": true,
          "updatedAt": "2024-10-05T10:10:00.000Z"
        },
        {
          "comment_id": 10036,
          "user_id": 67636,
          "nickname": "장서준",
          "contents": "이런 정보가 있었군요.",
          "likes": 4,
          "isLiked": false,
          "updatedAt": "2024-10-06T12:00:00.000Z"
        },
        {
          "comment_id": 10037,
          "user_id": 67637,
          "nickname": "이수현",
          "contents": "읽고 나니 유익한 것 같아요.",
          "likes": 15,
          "isLiked": true,
          "updatedAt": "2024-10-07T11:45:00.000Z"
        },
        {
          "comment_id": 10038,
          "user_id": 67638,
          "nickname": "유태오",
          "contents": "내용이 명쾌하네요.",
          "likes": 9,
          "isLiked": false,
          "updatedAt": "2024-10-08T14:20:00.000Z"
        },
        {
          "comment_id": 10039,
          "user_id": 67639,
          "nickname": "한진수",
          "contents": "더 많은 정보 부탁드려요.",
          "likes": 11,
          "isLiked": true,
          "updatedAt": "2024-10-09T13:30:00.000Z"
        },
        {
          "comment_id": 10040,
          "user_id": 67640,
          "nickname": "최유나",
          "contents": "좋은 주제라 생각합니다.",
          "likes": 19,
          "isLiked": false,
          "updatedAt": "2024-10-10T12:10:00.000Z"
        },
        {
          "comment_id": 10041,
          "user_id": 67641,
          "nickname": "권해리",
          "contents": "이런 글을 많이 써주세요!",
          "likes": 16,
          "isLiked": true,
          "updatedAt": "2024-10-11T10:30:00.000Z"
        },
        {
          "comment_id": 10042,
          "user_id": 67642,
          "nickname": "윤상현",
          "contents": "좋은 생각입니다. 동의해요.",
          "likes": 14,
          "isLiked": false,
          "updatedAt": "2024-10-12T09:50:00.000Z"
        },
        {
          "comment_id": 10043,
          "user_id": 67643,
          "nickname": "김서영",
          "contents": "재미있는 글입니다. 계속 써주세요.",
          "likes": 5,
          "isLiked": false,
          "updatedAt": "2024-10-13T11:10:00.000Z"
        },
        {
          "comment_id": 10044,
          "user_id": 67644,
          "nickname": "박지우",
          "contents": "흥미로운 주제네요.",
          "likes": 8,
          "isLiked": true,
          "updatedAt": "2024-10-14T12:30:00.000Z"
        },
        {
          "comment_id": 10045,
          "user_id": 67645,
          "nickname": "정하늘",
          "contents": "감사합니다. 기대하겠습니다!",
          "likes": 12,
          "isLiked": false,
          "updatedAt": "2024-10-15T14:40:00.000Z"
        },
        {
          "comment_id": 10046,
          "user_id": 67646,
          "nickname": "이하늘",
          "contents": "내용이 좋네요. 잘 읽었습니다.",
          "likes": 7,
          "isLiked": false,
          "updatedAt": "2024-10-16T10:00:00.000Z"
        },
        {
          "comment_id": 10047,
          "user_id": 67647,
          "nickname": "장태연",
          "contents": "훌륭한 정보입니다. 감사합니다.",
          "likes": 15,
          "isLiked": true,
          "updatedAt": "2024-10-17T09:15:00.000Z"
        },
        {
          "comment_id": 10048,
          "user_id": 67648,
          "nickname": "윤수아",
          "contents": "더 많은 정보 공유해주세요.",
          "likes": 11,
          "isLiked": false,
          "updatedAt": "2024-10-18T11:25:00.000Z"
        },
        {
          "comment_id": 10049,
          "user_id": 67649,
          "nickname": "최성민",
          "contents": "매우 유익한 내용이네요!",
          "likes": 20,
          "isLiked": true,
          "updatedAt": "2024-10-19T12:35:00.000Z"
        }
      ]
    }
    ''';
    commentData = CommentData.fromJson(jsonDecode(jsonString));
    print(commentData.comments.length);
  }
  // TODO: 북마크 기능 추가, 신고 모달
  @override
  Widget build(BuildContext context) {
    List<Widget> _buildComment() {
      List<Widget> comment = [];
      for (int i = 0; i < commentData.comments.length; i++) {
        comment.add(
            CommentListTile(
              commentId: commentData.comments[i].commentId,
              name: commentData.comments[i].author,
              contents: commentData.comments[i].contents,
              likeCount: commentData.comments[i].likeCount,
              isLiked: commentData.comments[i].isLiked,
              createAt: commentData.comments[i].createdAt,
              isMyComment: true,
              isMyPost: false,
              isPoster: false,
              onPressed: () {
                PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(
                  // TODO: 임시로 commentId를 사용 중 수정 필요
                    PostDetailScreen(postId: commentData.comments[i].commentId,));
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
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}
