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
  List<Post>? data;

  @override
  void initState() {
    super.initState();
    _loadData('최신순');
  }

  Future<void> _loadData(String sortBy) async{
    // sortBy 매핑
    String sortCriteria;
    switch (sortBy) {
      case '최신순':
        sortCriteria = 'recent';
        break;
      case '좋아요':
        sortCriteria = 'likes';
        break;
      case '조회수':
        sortCriteria = 'views';
        break;
      default:
        sortCriteria = 'recent'; // 기본값
    }
    data = await trendAllPost(context, sortBy: sortCriteria);
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
                  _loadData(dropdownValueCriteria); // 정렬 기준 변경 시 데이터 로드
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
        if(data!.isEmpty) Center(child: Text('게시글 없음', style: TextStyle(fontSize: 16, color: Colors.grey),),),
      ],
    );
  }
}