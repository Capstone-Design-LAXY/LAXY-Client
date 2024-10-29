import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:laxy/common/component/list/list_header.dart';
import 'package:laxy/common/component/list/tag_ranking_list_tile.dart';
import 'package:laxy/common/component/page_route_with_animation.dart';
import 'package:laxy/screen/tag/community_screen.dart';
import 'package:laxy/screen/tag/tag_screen.dart';
import 'package:laxy/utils/utils.dart';

class TrendsCommunityTabView extends StatefulWidget {

  const TrendsCommunityTabView({
    Key? key,
  }) : super(key: key);

  @override
  State<TrendsCommunityTabView> createState() => _TrendsCommunityTabViewState();
}

class _TrendsCommunityTabViewState extends State<TrendsCommunityTabView> {
  late CommunityRankData communityRankData;

  @override
  void initState() {
    super.initState();

    String jsonString = '''
    {
      "rank": [
        {
          "tagId": 5500584,
          "tag_name": "정보공유",
          "bookmarked": 2260098,
          "count": 6054472,
          "grade": 1,
          "change": 3
        },
        {
          "tagId": 6483579,
          "tag_name": "꿀팁공유",
          "bookmarked": 1907232,
          "count": 1456826,
          "grade": 3,
          "change": 11
        },
        {
          "tagId": 7951011,
          "tag_name": "생활정보",
          "bookmarked": 3614974,
          "count": 4657548,
          "grade": 7,
          "change": 12
        },
        {
          "tagId": 2488542,
          "tag_name": "유용한팁",
          "bookmarked": 3775929,
          "count": 640068,
          "grade": 9,
          "change": -3
        },
        {
          "tagId": 7615117,
          "tag_name": "건강정보",
          "bookmarked": 1751088,
          "count": 4422214,
          "grade": 11,
          "change": 6
        },
        {
          "tagId": 714703,
          "tag_name": "노하우",
          "bookmarked": 312407,
          "count": 5254348,
          "grade": 10,
          "change": 9
        },
        {
          "tagId": 215707,
          "tag_name": "아이디어",
          "bookmarked": 3795284,
          "count": 5623334,
          "grade": 8,
          "change": 5
        },
        {
          "tagId": 2557334,
          "tag_name": "생활지혜",
          "bookmarked": 8934600,
          "count": 1063798,
          "grade": 6,
          "change": -3
        },
        {
          "tagId": 5596651,
          "tag_name": "DIY정보",
          "bookmarked": 3209647,
          "count": 2237288,
          "grade": 4,
          "change": 12
        },
        {
          "tagId": 4223100,
          "tag_name": "유익한정보",
          "bookmarked": 2794107,
          "count": 7819248,
          "grade": 2,
          "change": 7
        },
        {
          "tagId": 7080658,
          "tag_name": "공유합니다",
          "bookmarked": 6767962,
          "count": 3488927,
          "grade": 1,
          "change": 16
        },
        {
          "tagId": 9519070,
          "tag_name": "재테크팁",
          "bookmarked": 5339900,
          "count": 1616924,
          "grade": 3,
          "change": -8
        },
        {
          "tagId": 4857952,
          "tag_name": "경제정보",
          "bookmarked": 6674531,
          "count": 1682886,
          "grade": 5,
          "change": 17
        },
        {
          "tagId": 2348171,
          "tag_name": "신상정보",
          "bookmarked": 8472470,
          "count": 6828528,
          "grade": 7,
          "change": -5
        },
        {
          "tagId": 5580618,
          "tag_name": "최신트렌드",
          "bookmarked": 5484617,
          "count": 7964309,
          "grade": 8,
          "change": 19
        },
        {
          "tagId": 2833521,
          "tag_name": "취미생활",
          "bookmarked": 7578623,
          "count": 2622905,
          "grade": 2,
          "change": -14
        },
        {
          "tagId": 2461206,
          "tag_name": "자기계발",
          "bookmarked": 3739094,
          "count": 7101079,
          "grade": 9,
          "change": -16
        },
        {
          "tagId": 7258920,
          "tag_name": "공유팁",
          "bookmarked": 7157341,
          "count": 6396799,
          "grade": 11,
          "change": 5
        },
        {
          "tagId": 1485554,
          "tag_name": "효율적인삶",
          "bookmarked": 5595206,
          "count": 9024936,
          "grade": 9,
          "change": -5
        },
        {
          "tagId": 624399,
          "tag_name": "성공팁",
          "bookmarked": 831223,
          "count": 2078251,
          "grade": 6,
          "change": 20
        },
        {
          "tagId": 2213407,
          "tag_name": "일상공유",
          "bookmarked": 6522985,
          "count": 6053842,
          "grade": 9,
          "change": -8
        },
        {
          "tagId": 9936855,
          "tag_name": "정보나눔",
          "bookmarked": 2015806,
          "count": 9322703,
          "grade": 2,
          "change": -7
        },
        {
          "tagId": 487626,
          "tag_name": "자기관리",
          "bookmarked": 5152772,
          "count": 9895017,
          "grade": 3,
          "change": 0
        },
        {
          "tagId": 6790516,
          "tag_name": "꿀정보",
          "bookmarked": 7201143,
          "count": 6108552,
          "grade": 10,
          "change": 11
        },
        {
          "tagId": 3268746,
          "tag_name": "여행팁",
          "bookmarked": 592881,
          "count": 9947549,
          "grade": 9,
          "change": -2
        },
        {
          "tagId": 9652110,
          "tag_name": "핫아이템",
          "bookmarked": 5440574,
          "count": 8987255,
          "grade": 11,
          "change": -7
        },
        {
          "tagId": 7724125,
          "tag_name": "공부비법",
          "bookmarked": 8407184,
          "count": 2061683,
          "grade": 10,
          "change": 15
        },
        {
          "tagId": 5180552,
          "tag_name": "취업정보",
          "bookmarked": 7699420,
          "count": 2133848,
          "grade": 4,
          "change": 3
        },
        {
          "tagId": 9375815,
          "tag_name": "창업정보",
          "bookmarked": 3901958,
          "count": 317588,
          "grade": 8,
          "change": 12
        },
        {
          "tagId": 5882355,
          "tag_name": "트렌드",
          "bookmarked": 2433930,
          "count": 6811400,
          "grade": 9,
          "change": 3
        },
        {
          "tagId": 7885176,
          "tag_name": "생활꿀팁",
          "bookmarked": 238735,
          "count": 7528672,
          "grade": 1,
          "change": -5
        },
        {
          "tagId": 5114369,
          "tag_name": "새로운정보",
          "bookmarked": 5381543,
          "count": 7131875,
          "grade": 2,
          "change": -1
        },
        {
          "tagId": 638358,
          "tag_name": "유익한팁",
          "bookmarked": 3460731,
          "count": 9629388,
          "grade": 6,
          "change": 16
        },
        {
          "tagId": 8677574,
          "tag_name": "시간관리",
          "bookmarked": 4262404,
          "count": 3598322,
          "grade": 8,
          "change": 10
        },
        {
          "tagId": 8160234,
          "tag_name": "성공습관",
          "bookmarked": 2253146,
          "count": 4444424,
          "grade": 11,
          "change": -5
        },
        {
          "tagId": 1423944,
          "tag_name": "인생팁",
          "bookmarked": 1839150,
          "count": 4578354,
          "grade": 1,
          "change": -7
        },
        {
          "tagId": 5908906,
          "tag_name": "효율성향상",
          "bookmarked": 8426309,
          "count": 3904768,
          "grade": 5,
          "change": 18
        },
        {
          "tagId": 4867188,
          "tag_name": "건강관리",
          "bookmarked": 9638543,
          "count": 9545662,
          "grade": 7,
          "change": 8
        },
        {
          "tagId": 9200925,
          "tag_name": "팁공유",
          "bookmarked": 7717298,
          "count": 9629416,
          "grade": 9,
          "change": -20
        },
        {
          "tagId": 9059860,
          "tag_name": "업데이트정보",
          "bookmarked": 4680554,
          "count": 5432244,
          "grade": 11,
          "change": -17
        }
      ]
    }
    ''';

    // JSON 문자열을 RankData 객체로 파싱
    communityRankData = CommunityRankData.fromJson(jsonDecode(jsonString));

    print(communityRankData.rank.length);
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> _buildRank() {
      List<Widget> rank = [];
      for (int i = 0; i < communityRankData.rank.length; i++) {
        rank.add(
            TagRankingListTile(
              title: communityRankData.rank[i].name,
              rank: i + 1,
              bookmarked: communityRankData.rank[i].bookmarkCount,
              post: communityRankData.rank[i].postCount,
              // shift: communityRankData.rank[i].change,
              grade: communityRankData.rank[i].grade,
              onPressed: () {
                if(communityRankData.rank[i].grade! <= 5){
                PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(TagScreen(tagId: communityRankData.rank[i].tagId, tagName: communityRankData.rank[i].name,));
                Navigator.push(context, pageRouteWithAnimation.slideRightToLeft());
                }
                else {
                  PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(CommunityScreen(tagId: communityRankData.rank[i].tagId, tagName: communityRankData.rank[i].name,));
                  Navigator.push(context, pageRouteWithAnimation.slideRightToLeft());
                }
              },
            )
        );
      }
      return rank;
    }

    // TODO: 테마 적용
    return ListView(
      children: [
        // 헤더
        const ListHeader(
          iconColor: Color(0xFF5589D3),
          icon: Icons.trending_up,
          title: '인기 커뮤니티',
        ),
        const Padding(
          padding: EdgeInsets.only(top: 3, bottom: 1),
          child: Divider(height: 1, color: Color(0xFF48464C),),
        ),
        Column(
          children: _buildRank(),
        ),
      ],
    );
  }
}