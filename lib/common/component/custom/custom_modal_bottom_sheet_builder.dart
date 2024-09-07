import 'package:flutter/material.dart';

class CustomModalBottomSheetBuilder extends StatefulWidget {
  const CustomModalBottomSheetBuilder({super.key});

  @override
  State<CustomModalBottomSheetBuilder> createState() => _CustomModalBottomSheetBuilderState();
}

class _CustomModalBottomSheetBuilderState extends State<CustomModalBottomSheetBuilder> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // 공통 작업을 위한 함수
  Future<void> _submitText() async {
    await Future.delayed(Duration(seconds: 1)); // 비동기 작업
    print('Submitted Text: ${_controller.text}'); // 입력한 텍스트 출력
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20), // 왼쪽 위 둥근 모서리
          topRight: Radius.circular(20), // 오른쪽 위 둥근 모서리
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: Column(
        children: [
          TextField(
            minLines: 1,
            maxLines: 4,
            cursorColor: Color(0xFF5589D3),
            keyboardType: TextInputType.text,  // 엔터 키를 동작하지 않도록 설정
            textInputAction: TextInputAction.done, // 엔터 키 대신 완료 버튼 표시 (모바일 키보드에서)
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF5589D3),), // 포커스가 있을 때 밑줄 색상
              ),
            ),
            controller: _controller,
            onSubmitted: (String value) async {
              await _submitText(); // 같은 함수 호출
            },
          ),
          Row(
            children: [
              Spacer(),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Color(0xFF5589D3),
                ),
                child: Text('취소'),
                onPressed: () => {Navigator.pop(context)},
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
    );
  }
}
