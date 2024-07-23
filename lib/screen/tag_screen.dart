import 'package:flutter/material.dart';
import 'package:laxy/common/component/post_list_tile.dart';
import 'package:laxy/common/layout/default_layout.dart';

class TagScreen extends StatefulWidget {
  const TagScreen({super.key});

  @override
  State<TagScreen> createState() => _TagScreenState();
}

const List<String> criteriaList = <String>['최신순', '좋아요', '조회수'];
enum Menu { preview, share, getLink, remove, download }

class _TagScreenState extends State<TagScreen> {
  String dropdownValueCriteria = criteriaList.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('data'),
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back),),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.bookmark_outline)),
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            onSelected: (Menu item) {},
            color: Color(0xFFFFFFFF),
            itemBuilder: (BuildContext context) =>
              <PopupMenuEntry<Menu>>[
                const PopupMenuItem<Menu>(
                  value: Menu.preview,
                  child: ListTile(
                    leading: Icon(Icons.visibility_outlined),
                    title: Text('Preview'),
                  ),
                ),
                const PopupMenuItem<Menu>(
                  value: Menu.share,
                  child: ListTile(
                    leading: Icon(Icons.share_outlined),
                    title: Text('share'),
                  ),
                ),
                const PopupMenuItem<Menu>(
                  value: Menu.getLink,
                  child: ListTile(
                    leading: Icon(Icons.link_outlined),
                    title: Text('getLink'),
                  ),
                ),
                const PopupMenuItem<Menu>(
                  value: Menu.remove,
                  child: ListTile(
                    leading: Icon(Icons.delete_outline),
                    title: Text('remove'),
                  ),
                ),
                const PopupMenuDivider(),
                const PopupMenuItem<Menu>(
                  value: Menu.download,
                  child: ListTile(
                    leading: Icon(Icons.download_outlined),
                    title: Text('download'),
                  ),
                ),
              ]
          )
        ],
        backgroundColor: Color(0xFFFFFFFF),
        foregroundColor: Color(0xFF141218),
        surfaceTintColor: Color(0xFFFFFFFF),
      ),
      body: Container(
        color: Color(0xFFE2E6EA),
        // color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
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
          ),
        ),
      )
    );
  }
}
