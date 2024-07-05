import 'package:flutter/material.dart';

class TagRankingListTile extends StatelessWidget {
  final int? rank;

  const TagRankingListTile({
    this.rank = 1,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: 테마 적용
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
            Text('아 배고파'),
            Expanded(child: SizedBox()),
            Row(
              children: [
                Icon(Icons.bookmark, size: 15, color: Color(0xFF001C3A),),
                SizedBox(width: 2,),
                Container(
                    width: 23,
                    child: Text('10k', style: TextStyle(fontSize: 10))
                ),
              ],
            ),
            SizedBox(width: 2,),
            Row(
              children: [
                Icon(Icons.description_outlined, size: 15, color: Color(0xFF001C3A),),
                SizedBox(width: 2,),
                Container(
                    width: 23,
                    child: Text('100k', style: TextStyle(fontSize: 10))
                ),
              ],
            ),
            SizedBox(width: 2,),
            Row(
              children: [
                Icon(Icons.arrow_drop_up, size: 15, color: Color(0xFF5589D3),),
                Container(
                    width: 23,
                    child: Text('10k', style: TextStyle(fontSize: 10))
                ),
              ],
            ),
            SizedBox(width: 4,),
          ],
        ),
      ),
    );
  }
}