import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:flutter_quill_extensions/flutter_quill_extensions.dart';
import 'package:laxy/common/component/custom/custom_app_bar.dart';
import 'package:laxy/common/component/horizontal_expanded.dart';
import 'package:laxy/common/layout/post_layout.dart';

class PostViewerScreen extends StatefulWidget {
  final String title;
  final List<Map<String, dynamic>> contents;

  const PostViewerScreen({
    required this.title,
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
      appBar: CustomAppBar(title: widget.title,),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(height: 10,),
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
            SizedBox(height: 10,),
          ],
        ),
      )
    );

  }
}
