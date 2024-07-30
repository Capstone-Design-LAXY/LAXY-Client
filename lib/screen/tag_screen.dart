import 'package:flutter/material.dart';
import 'package:laxy/common/component/custom_app_bar.dart';
import 'package:laxy/common/component/custom_dropdown_button.dart';
import 'package:laxy/common/component/custom_popup_menu_button.dart';
import 'package:laxy/common/component/list_header.dart';
import 'package:laxy/common/component/post_list_tile.dart';
import 'package:laxy/common/const/enum.dart';

class TagScreen extends StatefulWidget {
  const TagScreen({super.key});

  @override
  State<TagScreen> createState() => _TagScreenState();
}

const List<String> criteriaList = <String>['최신순', '좋아요', '조회수'];

class _TagScreenState extends State<TagScreen> {
  String dropdownValueCriteria = criteriaList.first;

  // TODO: 북마크 기능 추가, 신고 모달
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

    return Scaffold(
      appBar:CustomAppBar(
        title: 'TagPage',
        children: [
          IconButton(onPressed: () {}, icon: Icon(Icons.bookmark_outline)),
          const CustomPopupMenuButton(
            menuItems: [Menu.report],
            tagId: 123123,
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
                    padding: const EdgeInsets.only(top: 3, bottom: 1),
                    child: Divider(height: 1, color: Color(0xFF48464C),),
                  ),
                  Column(
                    children: _buildPostListTiles(),
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
