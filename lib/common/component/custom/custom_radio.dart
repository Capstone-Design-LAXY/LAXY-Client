import 'package:flutter/material.dart';

class CustomRadio extends StatefulWidget {
  final Function(SingingCharacter?) onChanged; // 성별 선택 결과를 부모 위젯에 전달할 콜백 함수

  const CustomRadio({required this.onChanged, super.key});

  @override
  State<CustomRadio> createState() => _CustomRadioState();
}

enum SingingCharacter { M, F, N }

class _CustomRadioState extends State<CustomRadio> {

  SingingCharacter? _gender = SingingCharacter.N;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Row(
            children: [
              Radio<SingingCharacter>(
                value: SingingCharacter.M,
                groupValue: _gender,
                activeColor: Color(0xFF5589D3),
                onChanged: (SingingCharacter? value) {
                  setState(() {
                    _gender = value;
                    widget.onChanged(_gender); // 성별 선택 결과를 부모 위젯에 전달
                  });
                },
              ),
              Text('남자', style: TextStyle(color: Color(0xFF5589D3),),)
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Radio<SingingCharacter>(
                value: SingingCharacter.F,
                groupValue: _gender,
                activeColor: Color(0xFF5589D3),
                onChanged: (SingingCharacter? value) {
                  setState(() {
                    _gender = value;
                    widget.onChanged(_gender); // 성별 선택 결과를 부모 위젯에 전달
                  });
                },
              ),
              Text('여자', style: TextStyle(color: Color(0xFF5589D3),),)
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Radio<SingingCharacter>(
                value: SingingCharacter.N,
                groupValue: _gender,
                activeColor: Color(0xFF5589D3),
                onChanged: (SingingCharacter? value) {
                  setState(() {
                    _gender = value;
                    widget.onChanged(_gender); // 성별 선택 결과를 부모 위젯에 전달
                  });
                },
              ),
              Text('비공개', style: TextStyle(color: Color(0xFF5589D3),),)
            ],
          ),
        ),
      ],
    );
  }
}
