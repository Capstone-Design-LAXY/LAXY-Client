import 'package:flutter/material.dart';
import 'package:laxy/common/component/list/list_header.dart';
import 'package:laxy/common/component/list/tag_ranking_list_tile.dart';

class CommunityRecommendTabView extends StatefulWidget {

  const CommunityRecommendTabView({
    Key? key,
  }) : super(key: key);

  @override
  State<CommunityRecommendTabView> createState() => _CommunityRecommendTabView();
}

class _CommunityRecommendTabView extends State<CommunityRecommendTabView> {

  List<Widget> _buildTagRankingListTiles() {
    List<Widget> tiles = [];
    for (int i = 1; i <= 30; i++) {
      tiles.add(TagRankingListTile(rank: i, title: '이거슨 타이틀이여123123${i*15412}', onPressed: () {},));
    }
    return tiles;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: 테마 적용
    return ListView(
      children: [
        // 헤더
        ListHeader(
          title: "추천 태그",
          icon: Icons.recommend,
          iconColor: Color(0xFF5589D3),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 3, bottom: 1),
          child: Divider(height: 1, color: Color(0xFF48464C),),
        ),
        Column(
          children: _buildTagRankingListTiles(),
        ),
      ],
    );
  }
}