import 'package:flutter/material.dart';

class CustomDropdownButton extends StatefulWidget {
  final String valueGender;
  final Function(String?) onChanged;
  final List<String> items;

  const CustomDropdownButton({
    required this.items,
    required this.onChanged,
    required this.valueGender,
    super.key
  });

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  // TODO: 테마 적용
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: widget.valueGender,
      underline: const SizedBox.shrink(),
      icon: const Icon(Icons.expand_more, color: Color(0xFF001C3A),),
      style: TextStyle(
          fontSize: 12,
          color: Color(0xFF141218)
      ),
      dropdownColor: Color(0xFFFFFFFF),
      isDense: true,
      onChanged: widget.onChanged,
      items: widget.items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
