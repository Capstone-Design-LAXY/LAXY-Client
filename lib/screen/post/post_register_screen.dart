import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:laxy/common/component/custom/custom_app_bar.dart';
import 'package:laxy/common/component/custom/custom_chip_tags.dart';
import 'package:laxy/common/component/list/list_header.dart';
import 'package:laxy/common/layout/post_layout.dart';

class PostRegisterScreen extends StatefulWidget {
  const PostRegisterScreen({super.key});

  @override
  State<PostRegisterScreen> createState() => _PostRegisterScreenState();
}

class _PostRegisterScreenState extends State<PostRegisterScreen> {

  // 태그 리스트
  List<String> tagList = [];
  final quill.QuillController _controller = quill.QuillController.basic();

  @override
  void dispose() {
    _controller.dispose();
    // 작성한 게시글 출력해보기
    print(jsonEncode(_controller.document.toDelta().toJson()));
    print(tagList);
    super.dispose();
  }

  // TODO: 이미지 업로드 기능 추가 필요
  @override
  Widget build(BuildContext context) {
    return PostLayout(
      appBar: CustomAppBar(
        title: '게시글 작성',
        children: [
          IconButton(onPressed: () {print('작성 종료');}, icon: Icon(Icons.check)),
          SizedBox(width: 8,)
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          ListHeader(
            title: '태그 등록',
          ),
          CustomChipTags(
            list: tagList,
            hintText: '띄어쓰기로 등록(최대 10개)',
          ),
          // 헤더 (게시글 작성)
          SizedBox(height: 10,),
          ListHeader(title: '게시글 작성',),
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF), // 하얀색 배경
              borderRadius: BorderRadius.circular(5.0), // 둥근 테두리
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: '제목을 입력하세요.(50자 이내)',
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                border: InputBorder.none, // 기본 테두리 제거
              ),
              maxLines: null, // 텍스트 필드의 최대 줄 수를 제한하지 않음
              minLines: 1, // 최소 줄 수를 1로 설정
            ),
          ),
          SizedBox(height: 3,),
          Container(
            height: MediaQuery.of(context).size.height - 93, //화면 크기 - 90 픽셀
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF), // 하얀색 배경
              borderRadius: BorderRadius.circular(5.0), // 둥근 테두리
            ),
            child: Column(
              children: [
                quill.QuillToolbar.simple(
                  configurations: quill.QuillSimpleToolbarConfigurations(
                    controller: _controller,
                    showClipboardPaste: false,
                    showSubscript: false,
                    showSuperscript: false,
                    showClipboardCut: false,
                    showClipboardCopy: false,
                    showSearchButton: false,
                    showCodeBlock: false,
                    showClearFormat: false,
                    showFontFamily: false,
                    showIndent: true,
                    showInlineCode: false,
                    showListCheck: false,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Divider(),
                ),
                // Expanded가 없으면 overflow발생함
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: quill.QuillEditor.basic(
                      configurations: quill.QuillEditorConfigurations(
                        controller: _controller,
                        placeholder: "내용을 입력하세요.",
                        autoFocus: false,
                        scrollable: true,
                      ),
                    ),
                  ),
                ),
                // 키보드가 올라오면 올라오는만큼 공간이 생김
                SizedBox(height: 10 + MediaQuery.of(context).viewInsets.bottom,)
              ],
            ),
          ),
          SizedBox(height: 10,),
        ],
      )
    );

  }
}
