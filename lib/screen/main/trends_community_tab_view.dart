import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:laxy/common/component/list/list_header.dart';
import 'package:laxy/common/component/list/tag_ranking_list_tile.dart';
import 'package:laxy/common/component/page_route_with_animation.dart';
import 'package:laxy/screen/tag/community_screen.dart';
import 'package:laxy/screen/tag/tag_screen.dart';
import 'package:laxy/utils/http_utils.dart';
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
  List<Tag>? data;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async{
    data = await trendCommunity(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (data == null) {
      return Center(child: CircularProgressIndicator()); // 데이터 로드 중 로딩 인디케이터 표시
    }

    List<Widget> _buildRank() {
      List<Widget> rank = [];
      for (int i = 0; i < data!.length; i++) {
        rank.add(
            TagRankingListTile(
              name: data![i].name,
              rank: i + 1,
              bookmarkCount: data![i].bookmarkCount,
              postCount: data![i].postCount,
              // shift: data[i].change,
              grade: data![i].grade,
              onPressed: () {
                if(data![i].grade <= 5){
                PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(TagScreen(tagId: data![i].tagId, tagName: data![i].name,));
                Navigator.push(context, pageRouteWithAnimation.slideRightToLeft());
                }
                else {
                  PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(CommunityScreen(tagId: data![i].tagId, tagName: data![i].name,));
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