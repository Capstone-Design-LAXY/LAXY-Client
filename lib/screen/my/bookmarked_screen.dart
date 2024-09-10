import 'package:flutter/material.dart';
import 'package:laxy/common/component/custom/custom_app_bar.dart';
import 'package:laxy/common/component/custom/custom_dropdown_button.dart';
import 'package:laxy/common/component/custom/custom_popup_menu_button.dart';
import 'package:laxy/common/component/list/list_header.dart';
import 'package:laxy/common/component/list/post_list_tile.dart';
import 'package:laxy/common/component/list/tag_list_tile.dart';
import 'package:laxy/common/const/enum.dart';

class BookmarkedScreen extends StatelessWidget {
  const BookmarkedScreen({super.key});

  // TODO: 북마크 기능 추가, 신고 모달
  @override
  Widget build(BuildContext context) {

    List<Widget> _buildPostListTiles() {
      List<Widget> tiles = [];
      for (int i = 1; i <= 30; i++) {
        tiles.add(TagListTile(grade: 1 + i % 11,));
      }
      return tiles;
    }

    return Scaffold(
      appBar:CustomAppBar(
        title: '즐겨찾기한 태그',
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
