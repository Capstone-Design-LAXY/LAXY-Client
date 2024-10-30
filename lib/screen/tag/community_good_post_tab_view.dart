import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:laxy/common/component/list/list_header.dart';
import 'package:laxy/common/component/list/post_list_tile.dart';
import 'package:laxy/common/component/page_route_with_animation.dart';
import 'package:laxy/screen/post/post_detail_screen.dart';
import 'package:laxy/utils/http_utils.dart';
import 'package:laxy/utils/utils.dart';

class CommunityGoodPostTabView extends StatefulWidget {
  final String name;

  const CommunityGoodPostTabView({
    required this.name,
    Key? key,
  }) : super(key: key);

  @override
  State<CommunityGoodPostTabView> createState() => _CommunityGoodPostTabViewState();
}

class _CommunityGoodPostTabViewState extends State<CommunityGoodPostTabView> {
  List<Post>? data;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async{
    data = await communityGoodPost(context, name: widget.name);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (data == null) {
      return Center(child: CircularProgressIndicator()); // 데이터 로드 중 로딩 인디케이터 표시
    }

    List<Widget> _buildPosts() {
      List<Widget> posts = [];
      for (int i = 0; i < data!.length; i++) {
        posts.add(
            PostListTile(
              title: data![i].title,
              author: data![i].author,
              likeCount: data![i].likeCount,
              commentCount: data![i].commentCount,
              viewCount: data![i].viewCount,
              imageUrl: data![i].imageUrl,
              createdAt: data![i].createdAt,
              onPressed: () {
                PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(
                    PostDetailScreen(postId: data![i].postId,));
                Navigator.push(context, pageRouteWithAnimation.slideRightToLeft());
              },
            )
        );
      }
      return posts;
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
          children: _buildPosts(),
        ),
        if(data!.isEmpty) Center(child: Text('공감 게시글 없음', style: TextStyle(fontSize: 16, color: Colors.grey),),),
      ],
    );
  }
}