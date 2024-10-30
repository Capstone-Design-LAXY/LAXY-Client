import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:laxy/common/component/custom/custom_app_bar.dart';
import 'package:laxy/common/component/custom/custom_chip_tags.dart';
import 'package:laxy/common/component/list/list_header.dart';
import 'package:laxy/common/component/page_route_with_animation.dart';
import 'package:laxy/common/component/quill/custom_quill_writer.dart';
import 'package:laxy/common/component/show_dialog.dart';
import 'package:laxy/common/layout/post_layout.dart';
import 'package:http/http.dart' as http;
import 'package:laxy/screen/post/post_detail_screen.dart';
import 'package:laxy/utils/http_utils.dart';

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
  String? _uploadedFileUrl; // 업로드된 파일 URL을 저장할 변수
  List<String> tagList = [];

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

  String _getContentType(String path) {
    final extension = path.split('.').last.toLowerCase();
    switch (extension) {
      case 'jpg':
      case 'jpeg':
        return 'image/jpeg';
      case 'png':
        return 'image/png';
      case 'gif':
        return 'image/gif';
      case 'bmp':
        return 'image/bmp';
      default:
        return 'application/octet-stream'; // 기본값
    }
  }

  Future<void> _uploadImage(String localPath) async {
    final contentType = _getContentType(localPath);
    final bytes = await File(localPath).readAsBytes();

    final response = await http.post(
      Uri.parse('https://api.bytescale.com/v2/accounts/kW15cGZ/uploads/binary'),
      headers: {
        'Authorization': 'Bearer public_kW15cGZ3pbvhDgeuAVKuifkQ2PFB',
        'Content-Type': contentType,
      },
      body: bytes,
    );

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      setState(() {
        _uploadedFileUrl = jsonResponse['fileUrl']; // 파일 URL 저장
      });
    } else {
      setState(() {
        _uploadedFileUrl = null; // 실패 시 URL 초기화
      });
    }
  }

  Future<String> _processContent() async {
    final contents = jsonEncode(_controller.document.toDelta().toJson());
    final List<dynamic> delta = jsonDecode(contents);

    for (var item in delta) {
      if (item['insert'] is Map && item['insert'].containsKey('image')) {
        String imagePath = item['insert']['image'];

        // 이미지 경로가 로컬 경로인지 확인
        if (imagePath.startsWith('/data/user/') || imagePath.startsWith('file://')) {
          await _uploadImage(imagePath); // 이미지 업로드
          // 로컬 이미지 경로를 서버 URL로 교체
          item['insert']['image'] = _uploadedFileUrl ?? imagePath; // 업로드 실패 시 원본 경로 유지
        }
        // URL인 경우에는 아무 것도 하지 않음
      }
    }
    // 최종 게시글 내용 확인
    print('최종 게시글 내용: ${jsonEncode(delta)}');
    return jsonEncode(delta);
  }

  // TODO: 이미지 업로드 기능 추가 필요
  @override
  Widget build(BuildContext context) {
    return PostLayout(
      appBar: CustomAppBar(
        title: '게시글 수정',
        children: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () async{
              String? contents = jsonEncode(_controller.document.toDelta().toJson());
              bool contentsEmpty = contents == "\[\{\"insert\"\:\"\\n\"\}\]";
              if (contentsEmpty || tagList.isEmpty || _titleController.text.isEmpty) {
                showEmptyDialog(context, tagList.isEmpty, _titleController.text.isEmpty, contentsEmpty);
              }
              else if (contents.length > 10000) {
                showFullDialog(context, contents.length);
              }
              else {
                // 로딩 인디케이터 표시
                showDialog(
                  context: context,
                  barrierDismissible: false, // 배경 클릭으로 닫히지 않도록 설정
                  builder: (context) {
                    return Center(child: CircularProgressIndicator()); // 로딩 인디케이터
                  },
                );

                try {
                  // 내용 처리
                  String content = await _processContent();
                  await editPost(context, postId: widget.postId, title: _titleController.text, content: content, tags: tagList);
                  Navigator.pop(context); // 로딩 인디케이터 닫기
                  Navigator.pop(context); // 게시글 작성 창 닽기
                  PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(PostDetailScreen(postId: widget.postId,));
                  Navigator.push(context, pageRouteWithAnimation.slideRightToLeft());
                } catch (e) {
                  Navigator.pop(context); // 오류 발생 시 로딩 인디케이터 닫기
                  showErrorDialog(context, '게시글 등록에 실패했습니다.'); // 오류 메시지 표시
                }
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
