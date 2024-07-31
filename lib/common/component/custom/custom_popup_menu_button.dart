import 'package:flutter/material.dart';
import 'package:laxy/common/const/enum.dart';

class CustomPopupMenuButton extends StatefulWidget {
  final List<Menu> menuItems;
  final int? tagId;
  final int? postId;
  final int? commentId;

  const CustomPopupMenuButton({
    required this.menuItems,
    this.commentId,
    this.postId,
    this.tagId,
    super.key,
  });

  @override
  State<CustomPopupMenuButton> createState() => _CustomPopupMenuButtonState();
}

// 구성요소를 사용하기 위해서는 enum.dart를 import 해야함
class _CustomPopupMenuButtonState extends State<CustomPopupMenuButton> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Menu>(
      icon: const Icon(Icons.more_vert),
      onSelected: (Menu item) {
        // 메뉴 항목 선택 시 동작
        switch (item) {
          case Menu.viewer:
            print("Viewer selected");
            break;
          case Menu.report:
            print("Report selected for post ID: ${widget.tagId}");
            break;
          case Menu.modify:
            print("Modify selected");
            break;
          case Menu.delete:
            print("Delete selected");
            break;
        }
      },
      color: const Color(0xFFFFFFFF),
      itemBuilder: (BuildContext context) {
        List<PopupMenuEntry<Menu>> menuEntries = [];

        if (widget.menuItems.contains(Menu.viewer)) {
          menuEntries.add(
            const PopupMenuItem<Menu>(
              value: Menu.viewer,
              child: ListTile(
                leading: Icon(Icons.visibility_outlined),
                title: Text('게시글 뷰어'),
              ),
            ),
          );
        }

        if (widget.menuItems.contains(Menu.report)) {
          menuEntries.add(
            const PopupMenuItem<Menu>(
              value: Menu.report,
              child: ListTile(
                leading: Icon(Icons.report_outlined),
                title: Text('신고하기'),
              ),
            ),
          );
        }

        if (widget.menuItems.contains(Menu.modify) || widget.menuItems.contains(Menu.delete)) {
          menuEntries.add(
            const PopupMenuDivider()
          );
        }

        if (widget.menuItems.contains(Menu.modify)) {
          menuEntries.add(
            const PopupMenuItem<Menu>(
              value: Menu.modify,
              child: ListTile(
                leading: Icon(Icons.edit_note),
                title: Text('수정하기'),
              ),
            ),
          );
        }

        if (widget.menuItems.contains(Menu.delete)) {
          menuEntries.add(
            const PopupMenuItem<Menu>(
              value: Menu.delete,
              child: ListTile(
                leading: Icon(Icons.delete_outline),
                title: Text('삭제하기'),
              ),
            ),
          );
        }

        return menuEntries;
      },
    );
  }
}
