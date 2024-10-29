import 'package:flutter/material.dart';
import 'package:laxy/common/component/list/list_info.dart';

class TagRankingListTile extends StatelessWidget {
  final String? name;
  final int? bookmarkCount;
  final int? postCount;
  // final int? shift;
  final int? rank;
  final int? grade;
  final Function() onPressed;

  const TagRankingListTile({
    this.rank = 1,
    this.name = 'title',
    this.bookmarkCount = 100,
    this.postCount = 100,
    // this.shift,
    this.grade = 1,
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
            SizedBox(
              // color: Colors.black,
              height: 20,
              width: 30,
              child: Text('$rank', style: TextStyle(color: Color(0xFF001C3A)), textAlign: TextAlign.center,),
            ),
            SizedBox(width: 4,),
            // 타이틀
            Expanded(child: Text('$name', overflow: TextOverflow.ellipsis,)),
            ListInfo(
              icon: Icons.bookmark,
              num: bookmarkCount,
            ),
            ListInfo(
              icon: Icons.description_outlined,
              num: postCount,
            ),
            SizedBox(width: 2,),
            Icon(
              grade! <= 5
                ? Icons.sell_outlined
                : Icons.loyalty_outlined,
              color: Color(0xFF001C3A),
              size: 16,
            ),
            SizedBox(width: 5,)
            // if (shift != null)
            //   ListInfo(
            //     icon: shift == 0
            //         ? Icons.remove
            //         : shift! < 0
            //         ? Icons.arrow_drop_down
            //         : Icons.arrow_drop_up,
            //     iconColor: shift == 0
            //         ? Colors.grey
            //         : shift! < 0
            //         ? Color(0xFFFF4949)
            //         : Color(0xFF5589D3),
            //     num: shift,
            //   )
          ],
        ),
      ),
    );
  }
}