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
import 'package:laxy/common/var.dart';
import 'package:laxy/screen/post/post_detail_screen.dart';
import 'package:laxy/utils/auth_utils.dart';
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
  late TagData tagData;
  bool isLogin = false;

  @override
  void initState() {
    super.initState();
    tagData = fetchTagScreenData(widget.tagId);
    print(tagData.posts.length);
    _checkAccessToken();
  }

  void _checkAccessToken() async{
    bool loginStatus = await isAccessToken();
    setState(() {
      isLogin = loginStatus;
    });
    // print(isLogin);
  }

  // TODO: 북마크 기능 추가, 신고 모달
  @override
  Widget build(BuildContext context) {

    List<Widget> _buildPosts() {
      List<Widget> posts = [];
      for (int i = 0; i < tagData.posts.length; i++) {
        posts.add(
            PostListTile(
              title: tagData.posts[i].title,
              summary: tagData.posts[i].summary,
              like: tagData.posts[i].like,
              comment: tagData.posts[i].comments,
              imageURL: tagData.posts[i].imageURL,
              dateTime: tagData.posts[i].createdAt,
              onPressed: () {
                PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(
                    PostDetailScreen(postId: tagData.posts[i].postId,));
                Navigator.push(context, pageRouteWithAnimation.slideRitghtToLeft());
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
                tagData.isBookmarked && isLogin
                  ? Icons.bookmark
                  : Icons.bookmark_outline,
            ),
            onPressed: () {
              if (isLogin){
                setState(() {
                  toggleIsBookmarked(widget.tagId);
                  tagData = tagData.toggleIsBookmarked();
                });
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
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}
