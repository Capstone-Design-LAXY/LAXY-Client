import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:laxy/common/component/custom/custom_app_bar.dart';
import 'package:laxy/common/component/custom/custom_dropdown_button.dart';
import 'package:laxy/common/component/custom/custom_icon_button.dart';
import 'package:laxy/common/component/custom/custom_popup_menu_button.dart';
import 'package:laxy/common/component/horizontal_expanded.dart';
import 'package:laxy/common/component/list/comment_list_tile.dart';
import 'package:laxy/common/component/custom/custom_chip.dart';
import 'package:laxy/common/const/enum.dart';
import 'package:laxy/common/layout/post_layout.dart';
import 'package:laxy/utils/utils.dart';

class PostDetailScreen extends StatefulWidget {
  const PostDetailScreen({super.key});

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

const List<String> criteriaList = <String>['인기순', '최신순', 'MY'];

class _PostDetailScreenState extends State<PostDetailScreen> {

  String dropdownValueCriteria = criteriaList.first;

  final quill.QuillController _controller = quill.QuillController(
    document: quill.Document.fromJson(
      jsonDecode(r'[{"insert":"이거 어떻게 저장되는지 테스트\n여기서 엔터한번 누르고\n여기는 들여쓰기"},{"insert":"\n","attributes":{"indent":1}},{"insert":"여기는 "},{"insert":"굵게","attributes":{"bold":true}},{"insert":"\n여기는 "},{"insert":"하이퍼링크","attributes":{"link":"https://www.naver.com"}},{"insert":"\n여기는 "},{"insert":"글자 색조","attributes":{"color":"#FFFFEB3B"}},{"insert":"\n이거 어떻게 저장되는지 테스트\n여기서 엔터한번 누르고\n여기는 들여쓰기이거 어떻게 저장되는지 테스트\n여기서 엔터한번 누르고\n여기는 들여쓰기이거 어떻게 저장되는지 테스트\n여기서 엔터한번 누르고\n여기는 들여쓰기이거 어떻게 저장되는지 테스트\n여기서 엔터한번 누르고\n여기는 들여쓰기이거 어떻게 저장되는지 테스트\n여기서 엔터한번 누르고\n여기는 들여쓰기이거 어떻게 저장되는지 테스트\n여기서 엔터한번 누르고\n여기는 들여쓰기이거 어떻게 저장되는지 테스트\n여기서 엔터한번 누르고\n여기는 들여쓰기이거 어떻게 저장되는지 테스트\n여기서 엔터한번 누르고\n여기는 들여쓰기이거 어떻게 저장되는지 테스트\n여기서 엔터한번 누르고\n여기는 들여쓰기이거 어떻게 저장되는지 테스트\n여기서 엔터한번 누르고\n여기는 들여쓰기이거 어떻게 저장되는지 테스트\n여기서 엔터한번 누르고\n여기는 들여쓰기이거 어떻게 저장되는지 테스트\n여기서 엔터한번 누르고\n여기는 들여쓰기이거 어떻게 저장되는지 테스트\n여기서 엔터한번 누르고\n여기는 들여쓰기이거 어떻게 저장되는지 테스트\n여기서 엔터한번 누르고\n여기는 들여쓰기이거 어떻게 저장되는지 테스트\n여기서 엔터한번 누르고\n여기는 들여쓰기이거 어떻게 저장되는지 테스트\n여기서 엔터한번 누르고\n여기는 들여쓰기이거 어떻게 저장되는지 테스트\n여기서 엔터한번 누르고\n여기는 들여쓰기이거 어떻게 저장되는지 테스트\n여기서 엔터한번 누르고\n여기는 들여쓰기이거 어떻게 저장되는지 테스트\n여기서 엔터한번 누르고\n여기는 들여쓰기이거 어떻게 저장되는지 테스트\n여기서 엔터한번 누르고\n여기는 들여쓰기이거 어떻게 저장되는지 테스트\n여기서 엔터한번 누르고\n여기는 들여쓰기이거 어떻게 저장되는지 테스트\n여기서 엔터한번 누르고\n여기는 들여쓰기이거 어떻게 저장되는지 테스트\n여기서 엔터한번 누르고\n여기는 들여쓰기이거 어떻게 저장되는지 테스트\n여기서 엔터한번 누르고\n여기는 들여쓰기이거 어떻게 저장되는지 테스트\n여기서 엔터한번 누르고\n여기는 들여쓰기이거 어떻게 저장되는지 테스트\n여기서 엔터한번 누르고\n여기는 들여쓰기이거 어떻게 저장되는지 테스트\n여기서 엔터한번 누르고\n여기는 들여쓰기이거 어떻게 저장되는지 테스트\n여기서 엔터한번 누르고\n여기는 들여쓰기이거 어떻게 저장되는지 테스트\n여기서 엔터한번 누르고\n여기는 들여쓰기\n"}]')
    ),
    selection: const TextSelection.collapsed(offset: 0),
    readOnly: true,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PostLayout(
      appBar: CustomAppBar(
        title: '게시글 상세',
        children: [
          CustomIconButton(
            icon: Icons.favorite_outline,
            onPressed: () {},
            num: 200000,
          ),
          CustomIconButton(
            icon: Icons.add_comment_outlined,
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20), // 왼쪽 위 둥근 모서리
                        topRight: Radius.circular(20), // 오른쪽 위 둥근 모서리
                      ),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Column(
                      children: [
                        TextField(
                          minLines: 1,
                          maxLines: 4,
                          cursorColor: Color(0xFF5589D3),
                          decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF5589D3),), // 포커스가 있을 때 밑줄 색상
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Spacer(),
                            TextButton(
                                onPressed: (){},
                                style: TextButton.styleFrom(
                                  foregroundColor: Color(0xFF5589D3),
                                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), // 패딩 설정 (선택 사항)
                                ),
                                child: Text('취소')
                            ),
                            SizedBox(width: 4,),
                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                backgroundColor: Color(0xFF5589D3), // 배경색 설정
                                foregroundColor: Color(0xFFFFFFFF),
                                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), // 패딩 설정 (선택 사항)
                              ),
                              child: Text('확인'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }
              );
            },
            num: 201300,
          ),
          CustomPopupMenuButton(
            menuItems: Menu.values,
            postId: 123213,
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        children: [
          HorizontalExpanded(
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF), // 하얀색 배경
                borderRadius: BorderRadius.circular(5.0), // 둥근 테두리
              ),
              child: Text(
                '게시글 제목인데 이런식으로 50자 정도 가능함',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
          SizedBox(height: 3,),
          Container(
            height: 500,
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF), // 하얀색 배경
              borderRadius: BorderRadius.circular(5.0), // 둥근 테두리
            ),
            child: HorizontalExpanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: quill.QuillEditor.basic(
                  configurations: quill.QuillEditorConfigurations(
                    controller: _controller,
                    scrollable: true,
                    autoFocus: false,
                    readOnlyMouseCursor: MouseCursor.uncontrolled,
                    expands: true,
                    showCursor: false,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 3,),
          // 게시글 정보
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF), // 하얀색 배경
              borderRadius: BorderRadius.circular(5.0), // 둥근 테두리
            ),
            child: const Row(
              children: [
                Text(
                  '작성자: 이승목이승목',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                Spacer(),
                Text(
                  '2024.07.29 02:17',
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 4,),
          // 태그 헤더
          const Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 5, left: 2, right: 2),
                child: Icon(Icons.tag, color: Color(0xFF5589D3), size: 24,),
              ),
              Text(
                '태그',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w200
                ),
              ),
            ],
          ),
          // 태그 랩
          const HorizontalExpanded(
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
          // 댓글 헤더
          Row(
            // childern을 바닥에 붙임
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 2, right: 2),
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
                formatNum(20000),
                style: TextStyle(
                    fontSize: 12,
                ),
              ),
              Spacer(),
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
          const Column(
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
      )
    );

  }
}
