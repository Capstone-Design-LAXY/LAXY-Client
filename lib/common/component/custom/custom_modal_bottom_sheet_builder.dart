import 'package:flutter/material.dart';
import 'package:laxy/common/component/show_dialog.dart';
import 'package:laxy/utils/http_utils.dart';

class CustomModalBottomSheetBuilder extends StatefulWidget {
  final int? postId;
  final int? commentId;
  final TextEditingController controller;

  const CustomModalBottomSheetBuilder({
    this.postId,
    this.commentId,
    required this.controller,
    super.key
  });

  @override
  State<CustomModalBottomSheetBuilder> createState() => _CustomModalBottomSheetBuilderState();
}

class _CustomModalBottomSheetBuilderState extends State<CustomModalBottomSheetBuilder> {

  // 공통 작업을 위한 함수
  Future<void> _submitText() async {
    if(!widget.controller.text.trim().isEmpty && widget.controller.text.length <= 200){
      if (widget.postId != null){
        await writeComment(context, postId: widget.postId!, contents: widget.controller.text);
      }
      if (widget.commentId != null){
        await editComment(context, commentId: widget.commentId!, contents: widget.controller.text);
      }
      Navigator.pop(context);
    }
    else if(widget.controller.text.trim().isEmpty){
      showEmptyCommentDialog(context);
    }
    else {
      showFullCommentDialog(context, widget.controller.text.length);
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
              controller: widget.controller,
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
                    widget.controller.clear();  // TextField 내용 비우기
                    Navigator.pop(context);     // 모달 닫기
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
