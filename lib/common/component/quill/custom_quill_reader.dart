import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill_extensions/flutter_quill_extensions.dart';
import 'package:laxy/common/component/horizontal_expanded.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;

class CustomQuillReader extends StatefulWidget {
  final List<Map<String, dynamic>> content;

  const CustomQuillReader({
    required this.content,
    super.key
  });

  @override
  State<CustomQuillReader> createState() => _CustomQuillReaderState();
}

class _CustomQuillReaderState extends State<CustomQuillReader> {

  late quill.QuillController _controller;

  @override
  void initState() {
    super.initState();
    _controller = quill.QuillController(
      document: quill.Document.fromJson(
        widget.content
        // jsonDecode(r'[{"insert":"이거 "},{"insert":"에뮬레이터가","attributes":{"bold":true}},{"insert":" 메모리를 아주 많이 잡아 먹습니다\n예를 "},{"insert":"들자면","attributes":{"color":"#FF1E88E5"}},{"insert":" 이런 "},{"insert":"느낌집니다","attributes":{"background":"#FFEC407A"}},{"insert":".\n\n이게 어이없게 자동 수정이 들어가 있어서 \n계속 단어를 수정해주는데요"},{"insert":"\n","attributes":{"blockquote":true}},{"insert":"여기서 사진을 클립보드에서 붙여넣어보겠습니ㅏㄷ"},{"insert":"\n","attributes":{"list":"bullet"}},{"insert":{"image":"https://picsum.photos/200"}},{"insert":"ㅇ\n좋습니다 이제 사진을 넣었군요\n"}]')
      ),
      selection: const TextSelection.collapsed(offset: 0),
      readOnly: true,
    );
  }

  @override
  void dispose() {
    print(jsonEncode(_controller.document.toDelta().length));
    print(jsonEncode(_controller.document.toDelta()).runtimeType);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
