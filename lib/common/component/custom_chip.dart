import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  const CustomChip({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(5.0),
        child: FilterChip(
          backgroundColor: Color(0xFF5589D3),
          label: Text(
            'Tag',
            style: TextStyle(color: Colors.white),
          ),

          onSelected: (value) => {},
        )
    );
  }
}
