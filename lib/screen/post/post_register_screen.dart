import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_chip_tags/flutter_chip_tags.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;

class PostRegisterScreen extends StatefulWidget {
  const PostRegisterScreen({super.key});

  @override
  State<PostRegisterScreen> createState() => _PostRegisterScreenState();
}



class _PostRegisterScreenState extends State<PostRegisterScreen> {
  List<String> _myList = [];
  final quill.QuillController _controller = quill.QuillController.basic();

  @override
  void dispose() {
    _controller.dispose();
    print(jsonEncode(_controller.document.toDelta().toJson()));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('게시글 작성'),
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back),),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(onPressed: () {}, icon: Icon(Icons.done_outline)),
          ),
        ],
        backgroundColor: Color(0xFFFFFFFF),
        foregroundColor: Color(0xFF141218),
        surfaceTintColor: Color(0xFFFFFFFF),
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
                  Container(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5, left: 2, right: 2),
                          child: SizedBox(width: 6, height: 30,),
                          // child: Icon(Icons.trending_up, color: Color(0xFF5589D3), size: 30,),
                        ),
                        Text(
                          '태그 등록',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w200
                          ),
                        ),
                        Expanded(child: SizedBox(),),

                      ],
                    ),
                  ),
                  ChipTags(
                    list: _myList,
                    separator: " ",
                    createTagOnSubmit: false,
                    chipColor: Color(0xFF5589D3),
                    decoration: InputDecoration(
                      hintText: '띄어쓰기로 등록',
                      filled: true, // 배경색을 채우기 위해 설정
                      fillColor: Colors.white, // 배경색을 하얀색으로 설정
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0), // 둥근 모서리 설정
                        borderSide: BorderSide.none, // 테두리 없음
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0), // 둥근 모서리 설정
                        borderSide: BorderSide.none, // 테두리 없음
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0), // 둥근 모서리 설정
                        borderSide: BorderSide.none, // 테두리 없음
                      ),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  // 헤더 (게시글 작성)
                  Container(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15, left: 2, right: 2),
                          child: SizedBox(width: 6, height: 30,),
                          // child: Icon(Icons.trending_up, color: Color(0xFF5589D3), size: 30,),
                        ),
                        Text(
                          '게시글 작성',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w200
                          ),
                        ),
                        Expanded(child: SizedBox(),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 3.0),
                    child: Container(
                      // height: 50,
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
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height - 90,
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF), // 하얀색 배경
                      borderRadius: BorderRadius.circular(5.0), // 둥근 테두리
                    ),
                    child: Column(
                      children: [
                        quill.QuillToolbar.simple(
                          configurations: quill.QuillSimpleToolbarConfigurations(
                            controller: _controller,
                            color: Colors.amber,
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
                        Divider(),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                          child: quill.QuillEditor.basic(
                            configurations: quill.QuillEditorConfigurations(
                              controller: _controller,
                              placeholder: "내용을 입력하세요.",
                              autoFocus: false,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5,),
                ],
              ),
            ),
          ],
        ),
      )
    );

  }
}
