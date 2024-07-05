import 'package:flutter/material.dart';
import 'package:laxy/common/component/post_list_tile.dart';
import 'package:laxy/common/component/post_ranking_list_tile.dart';
import 'package:laxy/common/component/tag_ranking_list_tile.dart';

class TrendsPostTabView extends StatefulWidget {

  const TrendsPostTabView({
    Key? key,
  }) : super(key: key);

  @override
  State<TrendsPostTabView> createState() => _TrendsPostTabView();
}

enum Main{ mindMap, trends }
const List<String> criteriaList = <String>['최신순', '좋아요', '조회수'];

class _TrendsPostTabView extends State<TrendsPostTabView>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  Main mainView = Main.trends;
  String dropdownValueCriteria = criteriaList.first;

  @override
  void initState() {
    super.initState();

    controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

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
                child: SizedBox(width: 6, height: 30,),
                // child: Icon(Icons.trending_up, color: Color(0xFF5589D3), size: 30,),
              ),
              Text(
                '전체 게시글',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w200
                ),
              ),
              Expanded(child: SizedBox(),),
              // 드롭다운
              Container(
                  child: DropdownButton<String>(
                    value: dropdownValueCriteria,
                    underline: SizedBox.shrink(),
                    icon: const Icon(Icons.expand_more, color: Color(0xFF001C3A),),
                    style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF141218)
                    ),
                    dropdownColor: Color(0xFFFFFFFF),
                    isDense: true,
                    onChanged: (String? criteriaValue) {
                      setState(() {
                        dropdownValueCriteria = criteriaValue!;
                      });
                    },
                    items: criteriaList.map<DropdownMenuItem<String>>((String criteriaValue) {
                      return DropdownMenuItem<String>(
                        value: criteriaValue,
                        child: Text(criteriaValue),
                      );
                    }).toList(),
                  )
              ),
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