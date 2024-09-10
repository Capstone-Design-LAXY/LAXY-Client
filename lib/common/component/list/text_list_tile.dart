import 'package:flutter/material.dart';

class TextListTile extends StatelessWidget {
  final Function() onPressed;
  final String title;

  const TextListTile({
    this.title = 'title',
    required this.onPressed,
    super.key
  });

  // TODO: 테마 적용
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: WidgetStateProperty.all(EdgeInsets.zero),
        overlayColor: WidgetStateProperty.all(Color(0xFF5589D3).withOpacity(0.1)),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0), // 모서리 둥글기 설정
            side: BorderSide(
              color: Color(0xFF5589D3),
            ),
          ),
        ),
      ),
      child: ListTile(
        title: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: Color(0xFF5589D3),
                ),
              )
            ),
            Icon(
              Icons.arrow_forward,
              color: Color(0xFF5589D3),
            )
          ],
        ),
      ),
    );
  }
}
