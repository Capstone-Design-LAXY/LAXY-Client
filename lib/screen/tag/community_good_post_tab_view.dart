import 'package:flutter/material.dart';
import 'package:laxy/common/component/list/list_header.dart';
import 'package:laxy/common/component/list/post_list_tile.dart';

class CommunityGoodPostTabView extends StatelessWidget {

  const CommunityGoodPostTabView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<Widget> _buildPostListTiles() {
      List<Widget> tiles = [];
      for (int i = 1; i <= 30; i++) {
        if (i%3 == 0)
          tiles.add(PostListTile(isImage: true,));
        else
          tiles.add(PostListTile());
      }
      return tiles;
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
          children: _buildPostListTiles(),
        ),
      ],
    );
  }
}