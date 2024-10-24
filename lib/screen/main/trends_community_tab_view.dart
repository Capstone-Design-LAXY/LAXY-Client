import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:laxy/common/component/list/list_header.dart';
import 'package:laxy/common/component/list/tag_ranking_list_tile.dart';
import 'package:laxy/common/component/page_route_with_animation.dart';
import 'package:laxy/common/var.dart';
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
    // JSON 문자열을 RankData 객체로 파싱
    communityRankData = trendsCommunityData;

    print(communityRankData.rank.length);
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> _buildRank() {
      List<Widget> rank = [];
      for (int i = 0; i < communityRankData.rank.length; i++) {
        rank.add(
            TagRankingListTile(
              title: communityRankData.rank[i].tagName,
              rank: i + 1,
              bookmarked: communityRankData.rank[i].bookmarked,
              post: communityRankData.rank[i].count,
              shift: communityRankData.rank[i].change,
              onPressed: () {
                if(communityRankData.rank[i].grade! <= 5){
                PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(TagScreen(tagId: communityRankData.rank[i].tagId, tagName: communityRankData.rank[i].tagName,));
                Navigator.push(context, pageRouteWithAnimation.slideRitghtToLeft());
                }
                else {
                  PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(CommunityScreen(tagId: communityRankData.rank[i].tagId, tagName: communityRankData.rank[i].tagName,));
                  Navigator.push(context, pageRouteWithAnimation.slideRitghtToLeft());
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