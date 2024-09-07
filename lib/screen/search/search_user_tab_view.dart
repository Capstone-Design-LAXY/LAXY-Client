import 'package:flutter/material.dart';
import 'package:laxy/common/component/custom/custom_dropdown_button.dart';
import 'package:laxy/common/component/list/list_header.dart';
import 'package:laxy/common/component/list/post_list_tile.dart';
import 'package:laxy/common/component/list/user_list_tile.dart';

class SearchUserTabView extends StatelessWidget {

  const SearchUserTabView({
    Key? key,
  }) : super(key: key);

  List<Widget> _buildPostListTiles() {
    List<Widget> tiles = [];
    for (int i = 1; i <= 30; i++) {
      if (i%3 == 0)
        tiles.add(UserListTile());
      else
        tiles.add(UserListTile());
    }
    return tiles;
  }

  @override
  Widget build(BuildContext context) {
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
