library flutter_chip_tags;

import 'package:flutter/material.dart';
import 'package:flutter_chip_tags/src/core/util/enum.dart';

class CustomChipTags extends StatefulWidget {
  const CustomChipTags({
    Key? key,
    this.iconColor,
    this.chipColor,
    this.textColor,
    this.decoration,
    this.keyboardType,
    this.separator = " ",
    this.createTagOnSubmit = false,
    this.chipPosition = ChipPosition.below,
    required this.list,
    this.hintText,
  }) : super(key: key);

  ///sets the remove icon Color
  final Color? iconColor;

  ///sets the chip background color
  final Color? chipColor;

  ///sets the color of text inside chip
  final Color? textColor;

  ///container decoration
  final InputDecoration? decoration;

  ///set keyboradType
  final TextInputType? keyboardType;

  ///customer symbol to seprate tags by default
  ///it is " " space.
  final String? separator;

  /// list of String to display
  final List<String> list;

  final String? hintText;

  final ChipPosition chipPosition;

  /// Default `createTagOnSumit = false`
  /// Creates new tag if user submit.
  /// If true they separtor will be ignored.
  final bool createTagOnSubmit;

  @override
  _CustomChipTagsState createState() => _CustomChipTagsState();
}

class _CustomChipTagsState extends State<CustomChipTags>
    with SingleTickerProviderStateMixin {
  FocusNode _focusNode = FocusNode();

  ///Form key for TextField
  final _formKey = GlobalKey<FormState>();
  TextEditingController _inputController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Form(
          key: _formKey,
          child: TextField(
            controller: _inputController,
            decoration: InputDecoration(
              hintText: widget.hintText,
              filled: true, // 배경색을 채우기 위해 설정
              fillColor: Colors.white, // 배경색을 하얀색으로 설정
              contentPadding: EdgeInsets.symmetric(horizontal: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0), // 둥근 모서리 설정
                borderSide: BorderSide.none, // 테두리 없음
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0), // 둥근 모서리 설정
                borderSide: BorderSide.none, // 테두리 없음
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0), // 둥근 모서리 설정
                borderSide: BorderSide.none, // 테두리 없음
              ),
            ),
            keyboardType: widget.keyboardType ?? TextInputType.text,
            textInputAction: TextInputAction.done,
            focusNode: _focusNode,
            onSubmitted: widget.createTagOnSubmit
                ? (value) {
              if (widget.list.length < 10 )widget.list.add(value);

              ///setting the controller to empty
              _inputController.clear();

              ///resetting form
              _formKey.currentState!.reset();

              ///refersing the state to show new data
              setState(() {});
              _focusNode.requestFocus();
            }
                : null,
            onChanged: widget.createTagOnSubmit
                ? null
                : (value) {
              ///check if user has send separator so that it can break the line
              ///and add that word to list
              if (value.endsWith(widget.separator ?? " ")) {
                ///check for ' ' and duplicate tags
                if (value != widget.separator &&
                    !widget.list.contains(value.trim()) && widget.list.length < 10 && value.trim().length <= 10) {
                  widget.list.add(value
                      .replaceFirst(widget.separator ?? " ", '')
                      .trim());
                }

                ///setting the controller to empty
                _inputController.clear();

                ///resetting form
                _formKey.currentState!.reset();

                ///refersing the state to show new data
                setState(() {});
              }
            },
          ),
        ),
        Visibility(
            child: _chipListPreview()),
      ],
    );
  }

  Visibility _chipListPreview() {
    return Visibility(
      //if length is 0 it will not occupie any space
      visible: widget.list.length > 0,
      child: Row(
        children: [
          Expanded(
            child: Wrap(
              spacing: -5,
              runSpacing: -15,
              ///creating a list
              children: widget.list.map((text) {
                return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: FilterChip(
                        // TODO: 테마 적용한다면 여기
                        backgroundColor: Color(0xFF5589D3),
                        label: Text(
                          text,
                          style: TextStyle(color: widget.textColor ?? Colors.white),
                        ),
                        avatar: Icon(Icons.remove_circle_outline,
                            color: widget.iconColor ?? Colors.white),
                        onSelected: (value) {
                          widget.list.remove(text);
                          setState(() {});
                        }));
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
