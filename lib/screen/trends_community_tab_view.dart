import 'package:flutter/material.dart';
import 'package:laxy/common/component/post_ranking_list_tile.dart';
import 'package:laxy/common/component/tag_ranking_list_tile.dart';

class TrendsCommunityTabView extends StatefulWidget {

  const TrendsCommunityTabView({
    Key? key,
  }) : super(key: key);

  @override
  State<TrendsCommunityTabView> createState() => _TrendsCommunityTabView();
}

enum Main{ mindMap, trends }

class _TrendsCommunityTabView extends State<TrendsCommunityTabView>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  Main mainView = Main.trends;

  @override
  void initState() {
    super.initState();

    controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: 테마 적용
    return ListView(
      children: [
        // 헤더
        // Divider(height: 1, color: Color(0xFF48464C),),
        Container(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 2, right: 2),
                child: Icon(Icons.trending_up, color: Color(0xFF5589D3), size: 30,),
              ),
              Text(
                '일간 인기 게시글',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w200
                ),
              ),
              Expanded(child: SizedBox(),),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 3, bottom: 1),
          child: Divider(height: 1, color: Color(0xFF48464C),),
        ),
        Column(
          children: <Widget>[
            // 리스트
            TagRankingListTile(rank: 1,),
            TagRankingListTile(rank: 2,),
            TagRankingListTile(rank: 3,),
            TagRankingListTile(rank: 4,),
            TagRankingListTile(rank: 5,),
            TagRankingListTile(rank: 6,),
            TagRankingListTile(rank: 7,),
            TagRankingListTile(rank: 8,),
            TagRankingListTile(rank: 9,),
            TagRankingListTile(rank: 10,),
            TagRankingListTile(rank: 1,),
            TagRankingListTile(rank: 2,),
            TagRankingListTile(rank: 3,),
            TagRankingListTile(rank: 4,),
            TagRankingListTile(rank: 5,),
            TagRankingListTile(rank: 6,),
            TagRankingListTile(rank: 7,),
            TagRankingListTile(rank: 8,),
            TagRankingListTile(rank: 9,),
            TagRankingListTile(rank: 10,),
            TagRankingListTile(rank: 1,),
            TagRankingListTile(rank: 2,),
            TagRankingListTile(rank: 3,),
            TagRankingListTile(rank: 4,),
            TagRankingListTile(rank: 5,),
            TagRankingListTile(rank: 6,),
            TagRankingListTile(rank: 7,),
            TagRankingListTile(rank: 8,),
            TagRankingListTile(rank: 9,),
            TagRankingListTile(rank: 10,),
          ],
        ),
      ],
    );
  }
}