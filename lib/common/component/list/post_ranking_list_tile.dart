import 'package:flutter/material.dart';
import 'package:laxy/common/component/list/list_info.dart';

class PostRankingListTile extends StatelessWidget {
  final String? title;
  final int? comment;
  final int? like;
  final int? rank;
  final Function() onPressed;

  const PostRankingListTile({
    this.rank = 1,
    this.title = 'title',
    this.comment = 100,
    this.like = 100,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: 테마 적용, onPress 연결해서 페이지 열기
    return SizedBox(
      height: 30,
      child: MaterialButton(
        // color: Colors.amber,
        onPressed: onPressed,
        elevation: 0,
        padding: EdgeInsets.zero,
        child: Row(
          children: [
            // 랭크
            SizedBox(
              height: 20,
              width: 30,
              child: Text('$rank', style: TextStyle(color: Color(0xFF001C3A)), textAlign: TextAlign.center,),
            ),
            SizedBox(width: 4,),
            // 타이틀
            Expanded(child: Text('$title', overflow: TextOverflow.ellipsis,)),
            ListInfo(
              icon: Icons.comment_outlined,
              num: comment,
            ),
            ListInfo(
              icon: Icons.favorite,
              num: like,
            ),
            // ListInfo(
            //   icon: shift == 0
            //       ? Icons.remove
            //       : shift! < 0
            //         ? Icons.arrow_drop_down
            //         : Icons.arrow_drop_up,
            //   iconColor: shift == 0
            //       ? Colors.grey
            //       : shift! < 0
            //         ? Color(0xFFFF4949)
            //         : Color(0xFF5589D3),
            //   num: shift,
            // )
          ],
        ),
      ),
    );
  }
}