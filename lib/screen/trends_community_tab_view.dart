import 'package:flutter/material.dart';
import 'package:laxy/common/component/list_header.dart';
import 'package:laxy/common/component/tag_ranking_list_tile.dart';

class TrendsCommunityTabView extends StatelessWidget {

  const TrendsCommunityTabView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<Widget> _buildTagRankingListTiles() {
      List<Widget> tiles = [];
      for (int i = 1; i <= 30; i++) {
        tiles.add(TagRankingListTile(rank: i, title: '이거슨 타이틀이여123123${i*15412}',));
      }
      return tiles;
    }

    // TODO: 테마 적용
    return ListView(
      children: [
        // 헤더
        const ListHeader(
          iconColor: Color(0xFF5589D3),
          icon: Icons.trending_up,
          title: '일간 인기 게시글',
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