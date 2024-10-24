import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:laxy/common/component/list/list_header.dart';
import 'package:laxy/common/component/list/post_list_tile.dart';
import 'package:laxy/common/component/page_route_with_animation.dart';
import 'package:laxy/common/var.dart';
import 'package:laxy/screen/post/post_detail_screen.dart';
import 'package:laxy/utils/utils.dart';

class CommunityGoodPostTabView extends StatefulWidget {
  final int tagId;

  const CommunityGoodPostTabView({
    required this.tagId,
    Key? key,
  }) : super(key: key);

  @override
  State<CommunityGoodPostTabView> createState() => _CommunityGoodPostTabViewState();
}

class _CommunityGoodPostTabViewState extends State<CommunityGoodPostTabView> {
  late PostData postData;

  @override
  void initState() {
    super.initState();

    String jsonString = '''
    {
      "posts": [
        {
          "post_id": 87291,
          "title": "오늘의 날씨는?",
          "summary": "비가 올 것 같아요. 우산 챙기세요.",
          "comments": 182,
          "like": 521,
          "viewed": 899,
          "createdAt": "2021-04-25T12:34:00.000Z"
        },
        {
          "post_id": 97852,
          "title": "새로운 취미 추천",
          "summary": "요즘 뜨는 취미는 무엇일까요?",
          "comments": 249,
          "like": 783,
          "viewed": 1374,
          "createdAt": "2022-02-15T08:22:00.000Z"
        },
        {
          "post_id": 11237,
          "title": "아침 운동의 중요성",
          "summary": "매일 아침 운동하는 습관!",
          "comments": 321,
          "like": 456,
          "viewed": 1023,
          "createdAt": "2020-09-12T07:40:00.000Z"
        },
        {
          "post_id": 56389,
          "title": "재테크 꿀팁 공유",
          "summary": "소액 투자로 시작하는 재테크",
          "comments": 405,
          "like": 642,
          "viewed": 1845,
          "createdAt": "2023-06-19T15:15:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 23876,
          "title": "여행 준비물 리스트",
          "summary": "꼭 챙겨야 할 필수 아이템들",
          "comments": 92,
          "like": 317,
          "viewed": 744,
          "createdAt": "2021-11-30T09:00:00.000Z"
        },
        {
          "post_id": 46378,
          "title": "추천 영화 리스트",
          "summary": "주말에 보기 좋은 영화들",
          "comments": 533,
          "like": 910,
          "viewed": 2458,
          "createdAt": "2019-07-18T14:10:00.000Z"
        },
        {
          "post_id": 91234,
          "title": "책 읽기의 장점",
          "summary": "매일 책 읽기의 중요성을 알아봅시다.",
          "comments": 67,
          "like": 155,
          "viewed": 481,
          "createdAt": "2020-10-10T18:24:00.000Z"
        },
        {
          "post_id": 66728,
          "title": "반려동물 관리 방법",
          "summary": "강아지 털 관리 팁",
          "comments": 187,
          "like": 259,
          "viewed": 891,
          "createdAt": "2021-08-22T04:05:00.000Z"
        },
        {
          "post_id": 57893,
          "title": "헬스장 추천",
          "summary": "어디 헬스장이 좋은가요?",
          "comments": 200,
          "like": 378,
          "viewed": 1298,
          "createdAt": "2022-01-02T11:45:00.000Z"
        },
        {
          "post_id": 34892,
          "title": "IT 트렌드 분석",
          "summary": "올해 뜨는 IT 기술은?",
          "comments": 450,
          "like": 821,
          "viewed": 2114,
          "createdAt": "2020-02-24T16:18:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 89347,
          "title": "최신 가전제품",
          "summary": "최신 스마트 가전 소개합니다.",
          "comments": 134,
          "like": 452,
          "viewed": 1203,
          "createdAt": "2023-05-14T21:50:00.000Z"
        },
        {
          "post_id": 23901,
          "title": "등산 코스 추천",
          "summary": "가을에 가기 좋은 산",
          "comments": 98,
          "like": 245,
          "viewed": 621,
          "createdAt": "2022-09-21T05:11:00.000Z"
        },
        {
          "post_id": 70483,
          "title": "홈 카페 인테리어",
          "summary": "집에서 즐기는 홈 카페 꾸미기",
          "comments": 301,
          "like": 502,
          "viewed": 1501,
          "createdAt": "2021-03-10T14:55:00.000Z"
        },
        {
          "post_id": 53692,
          "title": "내일의 주식 전망",
          "summary": "주식 시장 분석과 내일의 전망",
          "comments": 775,
          "like": 923,
          "viewed": 3095,
          "createdAt": "2023-02-28T08:40:00.000Z"
        },
        {
          "post_id": 13290,
          "title": "다이어트 식단",
          "summary": "건강한 식단으로 체중 감량하기",
          "comments": 354,
          "like": 620,
          "viewed": 1450,
          "createdAt": "2020-06-17T07:30:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 49723,
          "title": "쇼핑몰 추천",
          "summary": "가성비 좋은 온라인 쇼핑몰 추천",
          "comments": 156,
          "like": 399,
          "viewed": 1084,
          "createdAt": "2019-12-05T03:17:00.000Z"
        },
        {
          "post_id": 89014,
          "title": "내가 사랑하는 음악",
          "summary": "요즘 듣고 있는 음악 추천",
          "comments": 66,
          "like": 289,
          "viewed": 672,
          "createdAt": "2021-07-22T02:02:00.000Z"
        },
        {
          "post_id": 78512,
          "title": "명언 모음집",
          "summary": "삶에 도움이 되는 명언들",
          "comments": 402,
          "like": 703,
          "viewed": 1822,
          "createdAt": "2020-11-12T09:50:00.000Z"
        },
        {
          "post_id": 58329,
          "title": "헬시푸드 레시피",
          "summary": "간단하고 건강한 요리법",
          "comments": 285,
          "like": 563,
          "viewed": 1307,
          "createdAt": "2023-03-23T13:07:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 29387,
          "title": "여행 후기 공유",
          "summary": "최근 다녀온 여행 후기를 남겨요.",
          "comments": 141,
          "like": 329,
          "viewed": 889,
          "createdAt": "2022-05-06T12:14:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 97245,
          "title": "독서 습관 들이기",
          "summary": "하루 10분 독서로 시작하기",
          "comments": 158,
          "like": 487,
          "viewed": 1249,
          "createdAt": "2021-10-18T19:30:00.000Z"
        },
        {
          "post_id": 40982,
          "title": "간단한 운동법",
          "summary": "5분 만에 하는 스트레칭",
          "comments": 72,
          "like": 205,
          "viewed": 654,
          "createdAt": "2023-08-07T17:25:00.000Z"
        },
        {
          "post_id": 89120,
          "title": "요리 초보의 도전",
          "summary": "처음 해본 파스타 요리!",
          "comments": 186,
          "like": 423,
          "viewed": 1140,
          "createdAt": "2019-03-13T05:12:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 67653,
          "title": "매일 아침 루틴",
          "summary": "성공적인 아침 루틴 만들기",
          "comments": 321,
          "like": 612,
          "viewed": 1504,
          "createdAt": "2020-07-29T10:44:00.000Z"
        },
        {
          "post_id": 13987,
          "title": "온라인 클래스 추천",
          "summary": "취미를 배울 수 있는 사이트",
          "comments": 312,
          "like": 581,
          "viewed": 1319,
          "createdAt": "2022-11-02T03:25:00.000Z"
        },
        {
          "post_id": 91208,
          "title": "반려동물 입양",
          "summary": "입양 전 알아야 할 사항들",
          "comments": 128,
          "like": 394,
          "viewed": 1012,
          "createdAt": "2021-06-09T06:20:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 25781,
          "title": "커피 원두 추천",
          "summary": "향과 맛이 좋은 원두 추천",
          "comments": 85,
          "like": 221,
          "viewed": 754,
          "createdAt": "2020-01-15T18:35:00.000Z"
        },
        {
          "post_id": 10987,
          "title": "게임 추천",
          "summary": "요즘 핫한 게임은?",
          "comments": 411,
          "like": 759,
          "viewed": 2023,
          "createdAt": "2019-09-29T13:56:00.000Z"
        },
        {
          "post_id": 78012,
          "title": "자동차 관리 팁",
          "summary": "겨울철 자동차 관리 요령",
          "comments": 142,
          "like": 372,
          "viewed": 936,
          "createdAt": "2022-12-11T20:19:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 47982,
          "title": "집에서 하는 간단 요리",
          "summary": "쉬운 재료로 만드는 요리",
          "comments": 98,
          "like": 310,
          "viewed": 890,
          "createdAt": "2023-07-03T04:12:00.000Z"
        },
        {
          "post_id": 68371,
          "title": "책 추천",
          "summary": "마음의 양식을 채우는 도서",
          "comments": 183,
          "like": 533,
          "viewed": 1211,
          "createdAt": "2021-05-28T09:18:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 29382,
          "title": "공부 자극 글",
          "summary": "열심히 공부하는 법을 배워보세요.",
          "comments": 257,
          "like": 687,
          "viewed": 1589,
          "createdAt": "2022-08-10T14:28:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 47281,
          "title": "의류 쇼핑몰 추천",
          "summary": "저렴하고 트렌디한 의류 추천",
          "comments": 198,
          "like": 489,
          "viewed": 1187,
          "createdAt": "2020-05-05T22:10:00.000Z",
          "imageURL": "https://picsum.photos/200"
        },
        {
          "post_id": 98237,
          "title": "취미 만들기",
          "summary": "취미로 시작하는 나만의 프로젝트",
          "comments": 223,
          "like": 431,
          "viewed": 1205,
          "createdAt": "2019-01-17T10:55:00.000Z"
        },
        {
          "post_id": 13567,
          "title": "알뜰 쇼핑 팁",
          "summary": "저렴하게 쇼핑하는 방법",
          "comments": 302,
          "like": 675,
          "viewed": 1432,
          "createdAt": "2021-02-13T08:22:00.000Z"
        },
        {
          "post_id": 62589,
          "title": "겨울 스포츠 즐기기",
          "summary": "스키, 스노우보드 즐기는 팁",
          "comments": 109,
          "like": 312,
          "viewed": 819,
          "createdAt": "2022-12-23T05:47:00.000Z"
        },
        {
          "post_id": 32901,
          "title": "맛집 추천",
          "summary": "이번 주말 가볼만한 맛집",
          "comments": 457,
          "like": 801,
          "viewed": 2301,
          "createdAt": "2020-11-27T15:09:00.000Z",
          "imageURL": "https://picsum.photos/200"
        }
      ]
    }
    ''';

    // JSON 문자열을 RankData 객체로 파싱
    postData = fetchCommunityGoodData(widget.tagId);

    print(postData.posts.length);
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> _buildPosts() {
      List<Widget> posts = [];
      for (int i = 0; i < postData.posts.length; i++) {
        posts.add(
            PostListTile(
              title: postData.posts[i].title,
              summary: postData.posts[i].summary!,
              like: postData.posts[i].like!,
              comment: postData.posts[i].comments!,
              imageURL: postData.posts[i].imageURL,
              dateTime: postData.posts[i].createdAt,
              onPressed: () {
                PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(
                    PostDetailScreen(postId: postData.posts[i].postId,));
                Navigator.push(context, pageRouteWithAnimation.slideRitghtToLeft());
              },
            )
        );
      }
      return posts;
    }

    // TODO: 테마 적용
    return ListView(
      children: [
        // 헤더
        const ListHeader(
          title: "공감글",
          icon: Icons.favorite,
          iconColor: Color(0xFF5589D3),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 3, bottom: 1),
          child: Divider(height: 1, color: Color(0xFF48464C),),
        ),
        Column(
          children: _buildPosts(),
        ),
      ],
    );
  }
}