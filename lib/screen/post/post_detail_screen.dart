import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:laxy/common/component/list/comment_list_tile.dart';
import 'package:laxy/common/component/custom/custom_chip.dart';

class PostDetailScreen extends StatefulWidget {
  const PostDetailScreen({super.key});

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

const List<String> criteriaList = <String>['인기순', '최신순', 'MY'];
enum Menu { preview, share, getLink, remove, download }

class _PostDetailScreenState extends State<PostDetailScreen>
    with SingleTickerProviderStateMixin {

  final TextEditingController _textController = TextEditingController();
  String dropdownValueCriteria = criteriaList.first;
  List<String> _myList = [];
  final ScrollController _scrollController = ScrollController();

  final quill.QuillController _controller = quill.QuillController(
    document: quill.Document.fromJson(
      jsonDecode(r'[{"insert":"이거 어떻게 저장되는지 테스트\n여기서 엔터한번 누르고\n여기는 들여쓰기"},{"insert":"\n","attributes":{"indent":1}},{"insert":"여기는 "},{"insert":"굵게","attributes":{"bold":true}},{"insert":"\n여기는 "},{"insert":"하이퍼링크","attributes":{"link":"https://www.naver.com"}},{"insert":"\n여기는 "},{"insert":"글자 색조","attributes":{"color":"#FFFFEB3B"}},{"insert":"\n이거 어떻게 저장되는지 테스트\n여기서 엔터한번 누르고\n여기는 들여쓰기이거 어떻게 저장되는지 테스트\n여기서 엔터한번 누르고\n여기는 들여쓰기이거 어떻게 저장되는지 테스트\n여기서 엔터한번 누르고\n여기는 들여쓰기이거 어떻게 저장되는지 테스트\n여기서 엔터한번 누르고\n여기는 들여쓰기이거 어떻게 저장되는지 테스트\n여기서 엔터한번 누르고\n여기는 들여쓰기이거 어떻게 저장되는지 테스트\n여기서 엔터한번 누르고\n여기는 들여쓰기이거 어떻게 저장되는지 테스트\n여기서 엔터한번 누르고\n여기는 들여쓰기이거 어떻게 저장되는지 테스트\n여기서 엔터한번 누르고\n여기는 들여쓰기이거 어떻게 저장되는지 테스트\n여기서 엔터한번 누르고\n여기는 들여쓰기이거 어떻게 저장되는지 테스트\n여기서 엔터한번 누르고\n여기는 들여쓰기이거 어떻게 저장되는지 테스트\n여기서 엔터한번 누르고\n여기는 들여쓰기이거 어떻게 저장되는지 테스트\n여기서 엔터한번 누르고\n여기는 들여쓰기이거 어떻게 저장되는지 테스트\n여기서 엔터한번 누르고\n여기는 들여쓰기이거 어떻게 저장되는지 테스트\n여기서 엔터한번 누르고\n여기는 들여쓰기이거 어떻게 저장되는지 테스트\n여기서 엔터한번 누르고\n여기는 들여쓰기이거 어떻게 저장되는지 테스트\n여기서 엔터한번 누르고\n여기는 들여쓰기이거 어떻게 저장되는지 테스트\n여기서 엔터한번 누르고\n여기는 들여쓰기이거 어떻게 저장되는지 테스트\n여기서 엔터한번 누르고\n여기는 들여쓰기이거 어떻게 저장되는지 테스트\n여기서 엔터한번 누르고\n여기는 들여쓰기이거 어떻게 저장되는지 테스트\n여기서 엔터한번 누르고\n여기는 들여쓰기이거 어떻게 저장되는지 테스트\n여기서 엔터한번 누르고\n여기는 들여쓰기이거 어떻게 저장되는지 테스트\n여기서 엔터한번 누르고\n여기는 들여쓰기이거 어떻게 저장되는지 테스트\n여기서 엔터한번 누르고\n여기는 들여쓰기이거 어떻게 저장되는지 테스트\n여기서 엔터한번 누르고\n여기는 들여쓰기이거 어떻게 저장되는지 테스트\n여기서 엔터한번 누르고\n여기는 들여쓰기이거 어떻게 저장되는지 테스트\n여기서 엔터한번 누르고\n여기는 들여쓰기이거 어떻게 저장되는지 테스트\n여기서 엔터한번 누르고\n여기는 들여쓰기이거 어떻게 저장되는지 테스트\n여기서 엔터한번 누르고\n여기는 들여쓰기이거 어떻게 저장되는지 테스트\n여기서 엔터한번 누르고\n여기는 들여쓰기\n"}]')
    ),
    selection: const TextSelection.collapsed(offset: 0),
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('게시글 상세'),
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back),),
        backgroundColor: Color(0xFFFFFFFF),
        foregroundColor: Color(0xFF141218),
        surfaceTintColor: Color(0xFFFFFFFF),
        actions: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
            IconButton(onPressed: () {},icon: Icon(Icons.thumb_up_outlined)),
            Positioned(bottom: 2, child: Text('200k', style: TextStyle(fontSize: 8),)),
          ],),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.add_comment_outlined)),
              Positioned(bottom: 2, child: Text('200k', style: TextStyle(fontSize: 8),)),
          ],),
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
                  title: Text('게시글 뷰어'),
                ),
              ),
              const PopupMenuItem<Menu>(
                value: Menu.remove,
                child: ListTile(
                  leading: Icon(Icons.report_outlined),
                  title: Text('신고하기'),
                ),
              ),
              const PopupMenuDivider(),
              const PopupMenuItem<Menu>(
                value: Menu.download,
                child: ListTile(
                  leading: Icon(Icons.delete_outline),
                  title: Text('삭제하기'),
                ),
              ),
            ],
          ),
        ]
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
                  Padding(
                    padding: const EdgeInsets.only(bottom: 3.0, top: 8),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFFFFFFF), // 하얀색 배경
                              borderRadius: BorderRadius.circular(5.0), // 둥근 테두리
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '게시글 제목인데 이런식으로 50자 정도 가능함',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 500,
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF), // 하얀색 배경
                      borderRadius: BorderRadius.circular(5.0), // 둥근 테두리
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
                            child: quill.QuillEditor(
                              configurations: quill.QuillEditorConfigurations(
                                controller: _controller,
                                scrollable: true,
                                autoFocus: false,
                                readOnlyMouseCursor: MouseCursor.uncontrolled,
                                expands: true,
                                showCursor: false,
                              ),
                              focusNode: FocusNode(canRequestFocus: false,),
                              scrollController: _scrollController,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // 게시글 정보
                  Padding(
                    padding: const EdgeInsets.only(bottom: 3, top: 3),
                    child: Container(
                      // height: 50,
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF), // 하얀색 배경
                        borderRadius: BorderRadius.circular(5.0), // 둥근 테두리
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '작성자: 이승목이승목',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Expanded(child: SizedBox()),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '2024.07.29 02:17',
                              style: TextStyle(
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // 태그 헤더
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5, left: 2, right: 2),
                        // child: SizedBox(width: 6, height: 30,),
                        child: Icon(Icons.tag, color: Color(0xFF5589D3), size: 24,),
                      ),
                      Text(
                        '태그',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w200
                        ),
                      ),
                      Expanded(child: SizedBox(),),
                    ],
                  ),
                  // 태그 랩
                  Row(
                    children: [
                      Expanded(
                        child: Wrap(
                          alignment: WrapAlignment.start,
                          spacing: -5,
                          runSpacing: -15,
                          children: <Widget>[
                            CustomChip(),
                            CustomChip(),
                            CustomChip(),
                            CustomChip(),
                            CustomChip(),
                            CustomChip(),
                            CustomChip(),
                            CustomChip(),
                            CustomChip(),
                            CustomChip(),
                          ],
                        ),
                      ),
                    ],
                  ),
                  // 댓글 헤더
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5, left: 2, right: 2),
                        // child: SizedBox(width: 6, height: 30,),
                        child: Icon(Icons.comment_outlined, color: Color(0xFF5589D3), size: 24,),
                      ),
                      Text(
                        '댓글',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w200
                        ),
                      ),
                      Text(
                        '100k',
                        style: TextStyle(
                            fontSize: 12,
                        ),
                      ),
                      Expanded(child: SizedBox(),),
                      DropdownButton<String>(
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
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      CommentListTile(),
                      CommentListTile(),
                      CommentListTile(),
                      CommentListTile(),
                      CommentListTile(),
                      CommentListTile(),
                    ],
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
