import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:laxy/common/component/custom/custom_app_bar.dart';
import 'package:laxy/common/component/horizontal_expanded.dart';
import 'package:laxy/common/layout/post_layout.dart';

class PostViewerScreen extends StatefulWidget {
  const PostViewerScreen({super.key});

  @override
  State<PostViewerScreen> createState() => _PostViewerScreenState();
}

class _PostViewerScreenState extends State<PostViewerScreen> {


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
      appBar: CustomAppBar(title: '게시글 뷰어',),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 3.0, top: 8),
              child: HorizontalExpanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF), // 하얀색 배경
                    borderRadius: BorderRadius.circular(5.0), // 둥근 테두리
                  ),
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
            Expanded(
              child: Container(
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
            ),
          ],
        ),
      )
    );

  }
}
