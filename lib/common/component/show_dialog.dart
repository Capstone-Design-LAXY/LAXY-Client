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