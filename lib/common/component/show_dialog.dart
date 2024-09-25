import 'package:flutter/material.dart';


void showErrorDialog(
    BuildContext context,
    String message
    ) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Color(0xFFFFFFFF),
        title: Text('오류'),
        content: Text(message),
        actions: <Widget>[
          ElevatedButton(
            style: TextButton.styleFrom(
              backgroundColor: Color(0xFFFFFFFF),
              foregroundColor: Color(0xFF5589D3),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('확인'),
          ),
        ],
      );
    },
  );
}

void showReportDialog(
    BuildContext context,
    int tagId
    ) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Color(0xFFFFFFFF),
        title: Text('신고하기'),
        content: Text('해당 태그를 신고하시겠습니까?'),
        actions: <Widget>[
          ElevatedButton(
            style: TextButton.styleFrom(
              backgroundColor: Color(0xFFFFFFFF),
              foregroundColor: Color(0xFF5589D3),
            ),
            onPressed: () {
              // TODO: 연결 필요
              print('------신고 접수 tagId: ${tagId}-------');
              Navigator.of(context).pop();
            },
            child: Text('신고', style: TextStyle(color: Colors.red),),
          ),
          ElevatedButton(
            style: TextButton.styleFrom(
              backgroundColor: Color(0xFFFFFFFF),
              foregroundColor: Color(0xFF5589D3),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('취소'),
          ),
        ],
      );
    },
  );
}

void showEmptyDialog(
    BuildContext context,
    bool isTagEmpty,
    bool isTitleEmpty,
    bool isContentEmpty
    ) {
  String message = '';
  isTagEmpty ? message += '입력된 태그가 없습니다.\n' : '';
  isTitleEmpty ? message += '입력된 게시글 제목이 없습니다.\n' : '';
  isContentEmpty ? message += '입력된 게시글 내용이 없습니다.\n' : '';

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Color(0xFFFFFFFF),
        title: Text('정보 부족'),
        content: Text(message),
        actions: <Widget>[
          ElevatedButton(
            style: TextButton.styleFrom(
              backgroundColor: Color(0xFFFFFFFF),
              foregroundColor: Color(0xFF5589D3),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('확인'),
          ),
        ],
      );
    },
  );
}

void showFullDialog(
    BuildContext context,
    int contentLength
    ) {

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Color(0xFFFFFFFF),
        title: Text('게시글 용량 초과'),
        content: Text('게시글을 10000자 이내로 작성해주세요\n 현재 입력된 내용: ${contentLength}자'),
        actions: <Widget>[
          ElevatedButton(
            style: TextButton.styleFrom(
              backgroundColor: Color(0xFFFFFFFF),
              foregroundColor: Color(0xFF5589D3),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('확인'),
          ),
        ],
      );
    },
  );
}