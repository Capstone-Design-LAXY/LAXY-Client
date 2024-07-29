import 'package:flutter/material.dart';
import 'package:laxy/common/component/post_list_tile.dart';
import 'package:laxy/common/component/post_ranking_list_tile.dart';
import 'package:laxy/common/component/tag_ranking_list_tile.dart';

class CommunityGoodPostTabView extends StatelessWidget {

  const CommunityGoodPostTabView({
    Key? key,
  }) : super(key: key);

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
                child: Icon(Icons.favorite, color: Color(0xFF5589D3), size: 30,),
              ),
              Text(
                '좋은 글',
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
            PostListTile(isImage: true,),
            PostListTile(),
            PostListTile(),
            PostListTile(),
            PostListTile(isImage: true,),
            PostListTile(),
            PostListTile(),
            PostListTile(),
            PostListTile(isImage: true,),
            PostListTile(),
            PostListTile(),
            PostListTile(isImage: true,),
            PostListTile(),
            PostListTile(),
            PostListTile(),
            PostListTile(),
            PostListTile(),
            PostListTile(),
            PostListTile(isImage: true,),
            PostListTile(),
          ],
        ),
      ],
    );
  }
}