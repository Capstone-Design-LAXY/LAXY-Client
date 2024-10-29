import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:laxy/common/component/custom/custom_dropdown_button.dart';
import 'package:laxy/common/component/list/list_header.dart';
import 'package:laxy/common/component/list/post_list_tile.dart';
import 'package:laxy/common/component/page_route_with_animation.dart';
import 'package:laxy/screen/post/post_detail_screen.dart';
import 'package:laxy/utils/http_utils.dart';
import 'package:laxy/utils/utils.dart';

class TrendsPostTabView extends StatefulWidget {

  const TrendsPostTabView({
    Key? key,
  }) : super(key: key);

  @override
  State<TrendsPostTabView> createState() => _TrendsPostTabView();
}

const List<String> criteriaList = <String>['최신순', '좋아요', '조회수'];

class _TrendsPostTabView extends State<TrendsPostTabView>
    with SingleTickerProviderStateMixin {
  String dropdownValueCriteria = criteriaList.first;
  late List<Post> data;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async{
    data = await trendAllPost(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> _buildPosts() {
      List<Widget> posts = [];
      for (int i = 0; i < data.length; i++) {
        posts.add(
            PostListTile(
              title: data[i].title,
              author: data[i].author,
              likeCount: data[i].likeCount,
              commentCount: data[i].commentCount,
              viewCount: data[i].viewCount,
              imageUrl: data[i].imageUrl,
              createdAt: data[i].createdAt,
              onPressed: () {
                PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(
                    PostDetailScreen(postId: data[i].postId,));
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
        ListHeader(
          title: '전체 게시글',
          children: [
            CustomDropdownButton(
              items: criteriaList,
              onChanged: (String? criteriaValue) {
                setState(() {
                  dropdownValueCriteria = criteriaValue!;
                });
              },
              valueGender: dropdownValueCriteria,
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(top: 3, bottom: 1),
          child: Divider(height: 1, color: Color(0xFF48464C),),
        ),
        Column(
          children: _buildPosts(),
        ),
      ],
    );
  }
}