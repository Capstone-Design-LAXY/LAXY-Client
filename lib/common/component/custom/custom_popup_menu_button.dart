import 'package:flutter/material.dart';
import 'package:laxy/common/component/page_route_with_animation.dart';
import 'package:laxy/common/component/show_dialog.dart';
import 'package:laxy/common/const/enum.dart';
import 'package:laxy/screen/post/post_edit_screen.dart';
import 'package:laxy/screen/post/post_viewer_screen.dart';

class CustomPopupMenuButton extends StatefulWidget {
  final List<Menu> menuItems;
  final int? tagId;
  final int? postId;
  final int? commentId;
  final String? title;
  final List<String>? tags;
  final String? content;

  const CustomPopupMenuButton({
    required this.menuItems,
    this.commentId,
    this.postId,
    this.tagId,
    this.content,
    this.tags,
    this.title,
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
            PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(PostViewerScreen());
            Navigator.push(context, pageRouteWithAnimation.slideRitghtToLeft());
            print("Viewer selected");
            break;
          case Menu.report:
            if (widget.tagId != null){
              print("Report selected for tag ID: ${widget.tagId}");
              showReportDialog(context, widget.tagId!);
            }
            if (widget.postId != null) {
              print("Report selected for post ID: ${widget.postId}");
              showReportPostDialog(context, widget.postId!);
            }
            break;
          case Menu.modify:
            print('임시 content 출력: ${widget.content}');
            PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(PostEditScreen(
              postId: widget.postId!,
              contents: r'[{"insert":"이거 "},{"insert":"에뮬레이터가","attributes":{"bold":true}},{"insert":" 메모리를 아주 많이 잡아 먹습니다\n예를 "},{"insert":"들자면","attributes":{"color":"#FF1E88E5"}},{"insert":" 이런 "},{"insert":"느낌집니다","attributes":{"background":"#FFEC407A"}},{"insert":".\n\n이게 어이없게 자동 수정이 들어가 있어서 \n계속 단어를 수정해주는데요"},{"insert":"\n","attributes":{"blockquote":true}},{"insert":"여기서 사진을 클립보드에서 붙여넣어보겠습니ㅏㄷ"},{"insert":"\n","attributes":{"list":"bullet"}},{"insert":{"image":"https://picsum.photos/200"}},{"insert":"ㅇ\n좋습니다 이제 사진을 넣었군요\n"}]',
              title: widget.title!,
              tagList: widget.tags!,
            ));
            Navigator.push(context, pageRouteWithAnimation.slideRitghtToLeft());
            break;
          case Menu.delete:
            print("------삭제 접수 postId: ${widget.postId}-------");
            Navigator.pop(context);
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
