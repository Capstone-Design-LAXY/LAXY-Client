import 'package:flutter/material.dart';
import 'package:laxy/common/component/custom/custom_dropdown_button.dart';
import 'package:laxy/common/component/list/list_header.dart';
import 'package:laxy/common/component/list/post_list_tile.dart';

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

  @override
  Widget build(BuildContext context) {
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
          padding: const EdgeInsets.only(top: 3, bottom: 1),
          child: Divider(height: 1, color: Color(0xFF48464C),),
        ),
        Column(
          children: _buildPostListTiles(),
        ),
      ],
    );
  }
}