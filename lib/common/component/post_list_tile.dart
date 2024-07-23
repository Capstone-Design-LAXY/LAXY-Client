import 'package:flutter/material.dart';

class PostListTile extends StatelessWidget {
  final bool isImage;

  const PostListTile({
    this.isImage = false,
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
                      Text('아 배고파', style: TextStyle(fontSize: 16),),
                      Expanded(child: SizedBox()),
                      Text('07-05 23:31', style: TextStyle(fontSize: 10)),
                      SizedBox(width: 2,),
                      Row(
                        children: [
                          Icon(Icons.comment_outlined, size: 15, color: Color(0xFF001C3A),),
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
                          Icon(Icons.favorite, size: 15, color: Color(0xFF001C3A),),
                          SizedBox(width: 2,),
                          Container(
                              width: 23,
                              child: Text('100k', style: TextStyle(fontSize: 10))
                          ),
                        ],
                      ),
                      SizedBox(width: 4,),
                    ],
                  ),
                  SizedBox(height: 2,),
                  Text(
                    '세부내용은 이런식으로 작성되는 내용인데 이렇게 작성하면 어떻게 표현되는지 잘 모르는 그런 느낌의',
                    style: TextStyle(fontSize: 12),
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          ),
          if (isImage)
            Container(
              color: Color(0xFFD4E3FF),
              child: Image(
                image: AssetImage('assets/sky.png'),
                height: 60,
                width: 60,
                fit: BoxFit.contain,
              ),
            ),
        ],
      ),
    );
  }
}