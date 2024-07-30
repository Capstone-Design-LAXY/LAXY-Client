import 'package:flutter/material.dart';
import 'package:laxy/common/component/list_info.dart';

class TagRankingListTile extends StatelessWidget {
  final String? title;
  final int? bookmarked;
  final int? post;
  final int? shift;
  final int? rank;

  const TagRankingListTile({
    this.rank = 1,
    this.title = 'title',
    this.bookmarked = 100,
    this.post = 100,
    this.shift = 3,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: 테마 적용, onPress 연결해서 페이지 열기
    return SizedBox(
      height: 30,
      child: MaterialButton(
        // color: Colors.amber,
        onPressed: () {},
        elevation: 0,
        padding: EdgeInsets.zero,
        child: Row(
          children: [
            Container(
              // color: Colors.black,
              height: 20,
              width: 30,
              child: Text('$rank', style: TextStyle(color: Color(0xFF001C3A)), textAlign: TextAlign.center,),
            ),
            SizedBox(width: 4,),
            // 타이틀
            Expanded(child: Text('$title', overflow: TextOverflow.ellipsis,)),
            ListInfo(
              icon: Icons.bookmark,
              num: bookmarked,
            ),
            ListInfo(
              icon: Icons.description_outlined,
              num: post,
            ),
            ListInfo(
              icon: shift! < 0 ? Icons.arrow_drop_down : Icons.arrow_drop_up,
              iconColor: shift! < 0 ? Color(0xFFFF4949) : Color(0xFF5589D3),
              num: shift,
            ),
          ],
        ),
      ),
    );
  }
}