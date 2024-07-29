import 'package:flutter/material.dart';
import 'package:laxy/common/component/post_list_tile.dart';
import 'package:laxy/common/component/post_ranking_list_tile.dart';
import 'package:laxy/common/component/tag_ranking_list_tile.dart';

class CommunityMyPostTabView extends StatefulWidget {

  const CommunityMyPostTabView({
    Key? key,
  }) : super(key: key);

  @override
  State<CommunityMyPostTabView> createState() => _CommunityMyPostTabView();
}

const List<String> criteriaList = <String>['전체', '게시글', '댓글', '좋아요'];

class _CommunityMyPostTabView extends State<CommunityMyPostTabView>
    with SingleTickerProviderStateMixin {
  String dropdownValueCriteria = criteriaList.first;

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
                // child: SizedBox(width: 6, height: 30,),
                child: Icon(Icons.account_circle, color: Color(0xFF5589D3), size: 30,),
              ),
              Text(
                '내가 작성한 글',
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