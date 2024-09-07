import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;

class CustomQuillWriter extends StatefulWidget {
  const CustomQuillWriter({super.key});

  @override
  State<CustomQuillWriter> createState() => _CustomQuillWriterState();
}

class _CustomQuillWriterState extends State<CustomQuillWriter> {

  final quill.QuillController _controller = quill.QuillController.basic();

  @override
  void dispose() {
    print(jsonEncode(_controller.document.toDelta().toJson()));
    _controller.dispose();
    // 작성한 게시글 출력해보기
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
