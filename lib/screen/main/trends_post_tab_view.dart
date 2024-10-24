import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:laxy/common/component/custom/custom_dropdown_button.dart';
import 'package:laxy/common/component/list/list_header.dart';
import 'package:laxy/common/component/list/post_list_tile.dart';
import 'package:laxy/common/component/page_route_with_animation.dart';
import 'package:laxy/common/var.dart';
import 'package:laxy/screen/post/post_detail_screen.dart';
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
  late PostData postData;

  @override
  void initState() {
    super.initState();
    postData = trendsPostData;

    print(postData.posts.length);
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> _buildPosts() {
      List<Widget> posts = [];
      for (int i = 0; i < postData.posts.length; i++) {
        posts.add(
            PostListTile(
              title: postData.posts[i].title,
              summary: postData.posts[i].summary!,
              like: postData.posts[i].like!,
              comment: postData.posts[i].comments!,
              imageURL: postData.posts[i].imageURL,
              dateTime: postData.posts[i].createdAt,
              onPressed: () {
                PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(
                    PostDetailScreen(postId: postData.posts[i].postId,));
                Navigator.push(context, pageRouteWithAnimation.slideRitghtToLeft());
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