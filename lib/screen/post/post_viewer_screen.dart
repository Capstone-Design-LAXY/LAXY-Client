import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:flutter_quill_extensions/flutter_quill_extensions.dart';
import 'package:laxy/common/component/custom/custom_app_bar.dart';
import 'package:laxy/common/component/horizontal_expanded.dart';
import 'package:laxy/common/layout/post_layout.dart';

class PostViewerScreen extends StatefulWidget {
  final List<Map<String, dynamic>> contents;

  const PostViewerScreen({
    required this.contents,
    super.key
  });

  @override
  State<PostViewerScreen> createState() => _PostViewerScreenState();
}

class _PostViewerScreenState extends State<PostViewerScreen> {
  late quill.QuillController _controller;

  @override
  void initState() {
    super.initState();
    _controller = quill.QuillController(
      document: quill.Document.fromJson(
          widget.contents,
      ),
      selection: const TextSelection.collapsed(offset: 0),
      readOnly: true,
    );
  }

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
                      // color: Colors.blue,
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
                        embedBuilders: kIsWeb ? FlutterQuillEmbeds.editorWebBuilders() : FlutterQuillEmbeds.editorBuilders(),
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
