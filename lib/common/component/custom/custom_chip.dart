import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  final int tagId;
  final String tagName;

  const CustomChip({
    required this.tagId,
    required this.tagName,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(5.0),
        child: FilterChip(
          backgroundColor: Color(0xFF5589D3),
          label: Text(
            tagName,
            style: TextStyle(color: Colors.white),
          ),
          onSelected: (value) => {},
        )
    );
  }
}
