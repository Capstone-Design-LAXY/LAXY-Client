import 'package:flutter/material.dart';
import 'package:laxy/common/component/list/list_header.dart';
import 'package:laxy/common/component/list/post_list_tile.dart';
import 'package:laxy/common/component/list/tag_list_tile.dart';

class SearchCommunityTabView extends StatelessWidget {

  const SearchCommunityTabView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<Widget> _buildPostListTiles() {
      List<Widget> tiles = [];
      for (int i = 1; i <= 30; i++) {
        tiles.add(TagListTile(grade: 6 + i % 6,));
      }
      return tiles;
    }

    // TODO: 테마 적용
    return ListView(
      children: [
        Column(
          children: _buildPostListTiles(),
        ),
      ],
    );
  }
}