import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:laxy/common/component/custom/custom_app_bar.dart';
import 'package:laxy/common/component/custom/custom_dropdown_button.dart';
import 'package:laxy/common/component/custom/custom_popup_menu_button.dart';
import 'package:laxy/common/component/list/list_header.dart';
import 'package:laxy/common/component/list/post_list_tile.dart';
import 'package:laxy/common/component/page_route_with_animation.dart';
import 'package:laxy/common/component/show_dialog.dart';
import 'package:laxy/common/const/enum.dart';
import 'package:laxy/screen/post/post_detail_screen.dart';
import 'package:laxy/utils/auth_utils.dart';
import 'package:laxy/utils/http_utils.dart';
import 'package:laxy/utils/utils.dart';

class TagScreen extends StatefulWidget {
  final String tagName;
  final int tagId;

  const TagScreen({
    required this.tagName,
    required this.tagId,
    super.key
  });

  @override
  State<TagScreen> createState() => _TagScreenState();
}

const List<String> criteriaList = <String>['최신순', '좋아요', '조회수'];

class _TagScreenState extends State<TagScreen> {
  String dropdownValueCriteria = criteriaList.first;
  bool isLogin = false;
  List<Post>? data;
  bool isBookmarked = false;

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
    isLogin = await isAccessToken();
    data = await tagPost(context, name: widget.tagName, sortBy: sortCriteria);
    if(isLogin) {
      isBookmarked = await checkBookmark(context, tagId: widget.tagId);
    }
    setState(() {});
  }

  // TODO: 북마크 기능 추가, 신고 모달
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
              author: data![i].author!,
              likeCount: data![i].likeCount!,
              commentCount: data![i].commentCount!,
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

    return Scaffold(
      appBar:CustomAppBar(
        title: widget.tagName,
        children: [
          IconButton(
            icon: Icon(
                isLogin && isBookmarked
                  ? Icons.bookmark
                  : Icons.bookmark_outline,
            ),
            onPressed: () {
              if (isLogin){
                if (isBookmarked) {
                  deleteBookmark(context, tagId: widget.tagId);
                  setState(() {isBookmarked = false;});
                }
                else {
                  addBookmark(context, tagId: widget.tagId);
                  setState(() {isBookmarked = true;});
                }
              }
              else {
                showLoginDialog(context);
              }
            },
          ),
          CustomPopupMenuButton(
            menuItems: [Menu.report],
            tagId: widget.tagId,
          ),
          const SizedBox(width: 4,)
        ],
      ),
      body: Container(
        color: Color(0xFFE2E6EA),
        // color: Colors.white,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  ListHeader(
                    title: "전체 게시글",
                    children: [
                      CustomDropdownButton(
                        items: criteriaList,
                        onChanged: (String? criteriaValue) {
                          setState(() {
                            dropdownValueCriteria = criteriaValue!;
                            _loadData(dropdownValueCriteria); // 정렬 기준 변경 시 데이터 로드
                          });
                        },
                        valueGender: dropdownValueCriteria
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
              ),
            ),
          ],
        ),
      )
    );
  }
}
