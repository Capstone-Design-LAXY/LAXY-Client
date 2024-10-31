import 'package:flutter/material.dart';
import 'package:laxy/common/component/show_dialog.dart';
import 'package:laxy/utils/http_utils.dart';

class CustomModalBottomSheetBuilder extends StatefulWidget {
  final int? postId;
  final int? commentId;
  final String? content;

  const CustomModalBottomSheetBuilder({
    this.postId,
    this.commentId,
    this.content,
    super.key
  });

  @override
  State<CustomModalBottomSheetBuilder> createState() => _CustomModalBottomSheetBuilderState();
}

class _CustomModalBottomSheetBuilderState extends State<CustomModalBottomSheetBuilder> {
  TextEditingController _commentController = TextEditingController();

  @override
  void initState() {
    if (widget.content != null) {
      _commentController.text = widget.content!;
    }
    super.initState();
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  // 공통 작업을 위한 함수
  Future<void> _submitText() async {
    if(_commentController.text.trim().isNotEmpty && _commentController.text.length <= 200){
      if (widget.postId != null){
        await writeComment(context, postId: widget.postId!, contents: _commentController.text);
      }
      if (widget.commentId != null){
        await editComment(context, commentId: widget.commentId!, contents: _commentController.text);
      }
      _commentController.clear();
      Navigator.pop(context);
    }
    else if(_commentController.text.trim().isEmpty){
      showEmptyCommentDialog(context);
    }
    else {
      showFullCommentDialog(context, _commentController.text.length);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), // 왼쪽 위 둥근 모서리
            topRight: Radius.circular(20), // 오른쪽 위 둥근 모서리
          ),
        ),
        padding: EdgeInsets.only(top: 5, bottom: MediaQuery.of(context).viewInsets.bottom + 5, left: 20, right: 20),
        child: Column(
          children: [
            TextField(
              minLines: 1,
              maxLines: null,
              scrollController: ScrollController(),
              cursorColor: Color(0xFF5589D3),
              keyboardType: TextInputType.multiline,  // 엔터 키를 동작하지 않도록 설정
              textInputAction: TextInputAction.newline, // 엔터 키 대신 완료 버튼 표시 (모바일 키보드에서)
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF5589D3),), // 포커스가 있을 때 밑줄 색상
                ),
              ),
              controller: _commentController,
            ),
            Row(
              children: [
                Spacer(),
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Color(0xFF5589D3),
                  ),
                  child: Text('취소'),
                  onPressed: () {
                    _commentController.clear();  // TextField 내용 비우기
                    Navigator.pop(context);
                  },
                ),
                SizedBox(width: 4,),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xFF5589D3),
                    foregroundColor: Color(0xFFFFFFFF),
                  ),
                  child: Text('확인'),
                  onPressed: () async {
                    await _submitText(); // 같은 함수 호출
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
