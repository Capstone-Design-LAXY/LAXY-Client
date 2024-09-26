import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:laxy/common/component/custom/custom_app_bar.dart';
import 'package:laxy/common/component/custom/custom_chip_tags.dart';
import 'package:laxy/common/component/list/list_header.dart';
import 'package:laxy/common/component/quill/custom_quill_writer.dart';
import 'package:laxy/common/component/show_dialog.dart';
import 'package:laxy/common/layout/post_layout.dart';

class PostEditScreen extends StatefulWidget {
  final int postId;
  final List<String> tagList;
  final String title;
  final List<Map<String, dynamic>> contents;

  const PostEditScreen({
    required this.postId,
    required this.tagList,
    required this.title,
    required this.contents,
    super.key
  });

  @override
  State<PostEditScreen> createState() => _PostEditScreenState();
}

class _PostEditScreenState extends State<PostEditScreen> {
  TextEditingController _titleController = TextEditingController();
  late quill.QuillController _controller;

  @override
  void initState() {
    super.initState();
    _controller = quill.QuillController(
      document: quill.Document.fromJson(
          widget.contents
      ),
      selection: const TextSelection.collapsed(offset: 0),
    );
    tagList += widget.tagList;
    _titleController.text = widget.title;
  }

  @override
  void dispose() {
    _controller.dispose();
    _titleController.dispose();
    super.dispose();
  }

  // 태그 리스트
  List<String> tagList = [];

  // TODO: 이미지 업로드 기능 추가 필요
  @override
  Widget build(BuildContext context) {
    return PostLayout(
      appBar: CustomAppBar(
        title: '게시글 수정',
        children: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              String? contents = jsonEncode(_controller.document.toDelta().toJson());
              bool contentsEmpty = contents == "\[\{\"insert\"\:\"\\n\"\}\]";
              if (contentsEmpty || tagList.isEmpty || _titleController.text.isEmpty) {
                showEmptyDialog(context, tagList.isEmpty, _titleController.text.isEmpty, contentsEmpty);
              }
              else if (contents.length > 10000) {
                showFullDialog(context, contents.length);
              }
              else {
                Navigator.pop(context);
                // print('작성 종료');
                // print(tagList);
                // print('제목: ${_titleController.text}');
                // print(jsonEncode(_controller.document.toDelta().toJson()));
                // print('작성 글자 수: ${jsonEncode(_controller.document.toDelta().toJson()).length}');

              }
            }
          ),
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
            hintText: '띄어쓰기로 등록(최대 10자, 10개)',
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
              controller: _titleController,
              decoration: InputDecoration(
                hintText: '제목을 입력하세요.(50자 이내)',
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                border: InputBorder.none, // 기본 테두리 제거
              ),
              maxLines: null, // 텍스트 필드의 최대 줄 수를 제한하지 않음
              minLines: 1, // 최소 줄 수를 1로 설정
              keyboardType: TextInputType.text,  // 엔터 키를 동작하지 않도록 설정
              textInputAction: TextInputAction.done, // 엔터 키 대신 완료 버튼 표시 (모바일 키보드에서)
            ),
          ),
          SizedBox(height: 3,),
          CustomQuillWriter(controller: _controller),
          SizedBox(height: 10,),
        ],
      )
    );

  }
}
