import 'package:flutter/material.dart';
import 'package:laxy/common/component/custom/custom_modal_bottom_sheet_builder.dart';
import 'package:laxy/screen/main/trends_screen.dart';
import 'package:laxy/screen/user/login_screen.dart';
import 'package:laxy/utils/http_utils.dart';


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

void showEmptyCommentDialog(BuildContext context,) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Color(0xFFFFFFFF),
        title: Text('정보 부족'),
        content: Text('입력된 댓글 내용이 없습니다.'),
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
void showFullCommentDialog(
    BuildContext context,
    int contentLength
    ) {

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Color(0xFFFFFFFF),
        title: Text('댓글 용량 초과'),
        content: Text('댓글을 200자 이내로 작성해주세요\n 현재 입력된 내용: ${contentLength}자'),
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

void showCommentDialog(
    BuildContext context,
    int commentId,
    int postId,
    String content,
    bool isMyPost,
    bool isMyComment,
    ) {
  TextEditingController _commentController = TextEditingController();
  _commentController.text = content;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Color(0xFFFFFFFF),
        title: Text('댓글'),
        content: Column(
          mainAxisSize: MainAxisSize.min, // 내용물에 맞춰 크기 조정
          children: [
            Visibility(
              visible: !isMyComment,
              child: ListTile(
                onTap: () {
                  showReportCommentDialog(context, commentId);
                  // Navigator.pop(context); // 다이얼로그 닫기
                  // 신고하기 동작
                  print('---------신고 접수 commentId: ${commentId}-----------');
                },
                leading: const Icon(Icons.report_outlined),
                title: const Text('신고하기'),
              ),
            ),
            Visibility(
              visible: isMyComment,
              child: ListTile(
                onTap: () {
                  Navigator.pop(context); // 다이얼로그 닫기
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return CustomModalBottomSheetBuilder(controller: _commentController, commentId: commentId,);
                    },
                    isScrollControlled: true,  // 스크롤이 가능하도록 설정
                  ).then((_) {
                    // BottomSheet가 닫힌 후 실행되는 코드
                    // String commentText = _commentController.text;
                    // 저장할 로직 추가 (예: 서버로 전송, 로컬 저장 등)
                    // print('수정된 댓글: ${commentText}');
                    // TextEditingController 비우기
                    _commentController.dispose();
                    Navigator.pop(context);
                  });
                  // 수정하기 동작
                  // print('---------수정 접수 commentId: ${commentId}-----------');
                },
                leading: const Icon(Icons.edit_note),
                title: const Text('수정하기'),
              ),
            ),
            Visibility(
              visible: isMyPost || isMyComment,
              child: ListTile(
                onTap: () {
                  showDeleteCommentDialog(context, commentId);
                  // Navigator.pop(context); // 다이얼로그 닫기
                  // 삭제하기 동작
                  // print('---------삭제 접수 commentId: ${commentId}-----------');
                },
                leading: const Icon(Icons.delete_outline),
                title: const Text('삭제하기'),
              ),
            ),
          ],
        ),
        actions: <Widget>[
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
void showReportPostDialog(
    BuildContext context,
    int postId
    ) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Color(0xFFFFFFFF),
        title: Text('신고하기'),
        content: Text('해당 게시글를 신고하시겠습니까?'),
        actions: <Widget>[
          ElevatedButton(
            style: TextButton.styleFrom(
              backgroundColor: Color(0xFFFFFFFF),
              foregroundColor: Color(0xFF5589D3),
            ),
            onPressed: () {
              // TODO: 연결 필요
              print('------신고 접수 postId: ${postId}-------');
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

void showWithdrawalDialog(
    BuildContext context,
    String nickname,
    String email,
    ) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Color(0xFFFFFFFF),
        title: Text('회원탈퇴'),
        content: Text('정말로 탈퇴 하시겠습니까?\n삭제된 계정은 복구되지 않습니다.\n삭제될 계정 닉네임: \n ${nickname}\n삭제될 계정 이메일: \n ${email}'),
        actions: <Widget>[
          ElevatedButton(
            style: TextButton.styleFrom(
              backgroundColor: Color(0xFFFFFFFF),
              foregroundColor: Color(0xFF5589D3),
            ),
            onPressed: () {
              deleteUser(context);
              print('------회원 탈퇴-------');
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => TrendsScreen()), // 홈 화면으로 이동
                    (Route<dynamic> route) => false, // 모든 기존 라우트 제거
              );
            },
            child: Text('탈퇴', style: TextStyle(color: Colors.red),),
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

void showDeletePostDialog(
    BuildContext context,
    int postId,
    ) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Color(0xFFFFFFFF),
        title: Text('게시글 삭제'),
        content: Text('정말로 삭제 하시겠습니까?\n삭제된 게시글은 복구되지 않습니다.'),
        actions: <Widget>[
          ElevatedButton(
            style: TextButton.styleFrom(
              backgroundColor: Color(0xFFFFFFFF),
              foregroundColor: Color(0xFF5589D3),
            ),
            onPressed: () {
              deletePost(context, postId: postId);
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            child: Text('삭제', style: TextStyle(color: Colors.red),),
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

void showDeleteCommentDialog(
    BuildContext context,
    int commentId,
    ) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Color(0xFFFFFFFF),
        title: Text('댓글 삭제'),
        content: Text('정말로 삭제 하시겠습니까?\n삭제된 댓글은 복구되지 않습니다.'),
        actions: <Widget>[
          ElevatedButton(
            style: TextButton.styleFrom(
              backgroundColor: Color(0xFFFFFFFF),
              foregroundColor: Color(0xFF5589D3),
            ),
            onPressed: () {
              deleteComment(context, commentId: commentId);
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            child: Text('삭제', style: TextStyle(color: Colors.red),),
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

void showReportCommentDialog(
    BuildContext context,
    int commentId
    ) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Color(0xFFFFFFFF),
        title: Text('신고하기'),
        content: Text('해당 댓글을 신고하시겠습니까?'),
        actions: <Widget>[
          ElevatedButton(
            style: TextButton.styleFrom(
              backgroundColor: Color(0xFFFFFFFF),
              foregroundColor: Color(0xFF5589D3),
            ),
            onPressed: () {
              // TODO: 연결 필요
              print('------신고 접수 postId: ${commentId}-------');
              Navigator.of(context).pop();
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

void showLoginDialog(
    BuildContext context,
    ) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Color(0xFFFFFFFF),
        title: Text('로그인 권고'),
        content: Text('해당 기능은 로그인 후 사용가능합니다.\n로그인 하시겠습니까?'),
        actions: <Widget>[
          ElevatedButton(
            style: TextButton.styleFrom(
              backgroundColor: Color(0xFFFFFFFF),
              foregroundColor: Color(0xFF5589D3),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            child: Text('로그인', style: TextStyle(color: Color(0xFF5589D3),),),
          ),
          ElevatedButton(
            style: TextButton.styleFrom(
              backgroundColor: Color(0xFFFFFFFF),
              foregroundColor: Color(0xFF000000),
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