import 'package:flutter/material.dart';

class CommentListTile extends StatelessWidget {

  const CommentListTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: 테마 적용
    return MaterialButton(
      shape: Border(
        bottom: BorderSide(
          color:  Color(0xFF48464C).withOpacity(0.3),
          width: 1,
        )
      ),
      // color: Colors.blue,
      onPressed: () {},
      onLongPress: () {print('longPress');},
      elevation: 0,
      padding: EdgeInsets.zero,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('여기는 닉네임', style: TextStyle(fontSize: 12, color: Color(0xFF141218).withOpacity(0.7)),),
                      Text(' ৹ ', style: TextStyle(fontSize: 12, color: Color(0xFF141218).withOpacity(0.7)),),
                      Text('5분 전', style: TextStyle(fontSize: 10, color: Color(0xFF141218).withOpacity(0.7)),),
                      Expanded(child: SizedBox()),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            Icon(Icons.thumb_up_alt_outlined, size: 15, color: Color(0xFF001C3A),),
                            SizedBox(width: 2,),
                            Container(
                                width: 23,
                                child: Text('100k', style: TextStyle(fontSize: 10))
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 4,),
                    ],
                  ),
                  SizedBox(height: 2,),
                  Text(
                    '세부내용은 이런식으로 작성되는 내용인데 이렇게 작성하면 어떻게 표현되는지 잘 모르는 그런 느낌의',
                    style: TextStyle(fontSize: 14),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}