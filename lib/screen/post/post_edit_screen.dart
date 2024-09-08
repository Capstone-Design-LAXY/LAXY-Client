import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:laxy/common/component/custom/custom_app_bar.dart';
import 'package:laxy/common/component/custom/custom_chip_tags.dart';
import 'package:laxy/common/component/list/list_header.dart';
import 'package:laxy/common/component/quill/custom_quill_writer.dart';
import 'package:laxy/common/layout/post_layout.dart';

class PostEditScreen extends StatefulWidget {
  const PostEditScreen({super.key});

  @override
  State<PostEditScreen> createState() => _PostEditScreenState();
}

class _PostEditScreenState extends State<PostEditScreen> {

  final quill.QuillController _controller = quill.QuillController(
    document: quill.Document.fromJson(
        jsonDecode(r'[{"insert":"이거 "},{"insert":"에뮬레이터가","attributes":{"bold":true}},{"insert":" 메모리를 아주 많이 잡아 먹습니다\n예를 "},{"insert":"들자면","attributes":{"color":"#FF1E88E5"}},{"insert":" 이런 "},{"insert":"느낌집니다","attributes":{"background":"#FFEC407A"}},{"insert":".\n\n이게 어이없게 자동 수정이 들어가 있어서 \n계속 단어를 수정해주는데요"},{"insert":"\n","attributes":{"blockquote":true}},{"insert":"여기서 사진을 클립보드에서 붙여넣어보겠습니ㅏㄷ"},{"insert":"\n","attributes":{"list":"bullet"}},{"insert":{"image":"https://picsum.photos/200"}},{"insert":"ㅇ\n좋습니다 이제 사진을 넣었군요\n"}]')
    ),
    selection: const TextSelection.collapsed(offset: 0),
  );

  @override
  void dispose() {
    print(jsonEncode(_controller.document.toDelta().toJson()));
    _controller.dispose();
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
            onPressed: () {print('작성 종료');}
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
