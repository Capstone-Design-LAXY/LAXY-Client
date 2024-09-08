import 'package:flutter/material.dart';

class CustomRadio extends StatefulWidget {
  const CustomRadio({super.key});

  @override
  State<CustomRadio> createState() => _CustomRadioState();
}

enum SingingCharacter { male, female, private }

class _CustomRadioState extends State<CustomRadio> {

  SingingCharacter? _gender = SingingCharacter.private;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Row(
            children: [
              Radio<SingingCharacter>(
                value: SingingCharacter.male,
                groupValue: _gender,
                activeColor: Color(0xFF5589D3),
                onChanged: (SingingCharacter? value) {
                  setState(() {
                    _gender = value;
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
                value: SingingCharacter.female,
                groupValue: _gender,
                activeColor: Color(0xFF5589D3),
                onChanged: (SingingCharacter? value) {
                  setState(() {
                    _gender = value;
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
                value: SingingCharacter.private,
                groupValue: _gender,
                activeColor: Color(0xFF5589D3),
                onChanged: (SingingCharacter? value) {
                  setState(() {
                    _gender = value;
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
