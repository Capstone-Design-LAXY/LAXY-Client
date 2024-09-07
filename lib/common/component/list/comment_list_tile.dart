import 'package:flutter/material.dart';
import 'package:laxy/common/component/horizontal_expanded.dart';

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
      onPressed: () {},
      onLongPress: () {print('longPress');},
      elevation: 0,
      padding: EdgeInsets.zero,
      child: HorizontalExpanded(
        child: Padding(
          padding: const EdgeInsets.only(top: 2, bottom: 4, right: 8, left: 8),
          child: Column(
            children: [
              Row(
                children: [
                  // 작성자 아이콘
                  // Icon(Icons.edit, size: 12, color: Color(0xFF5589D3),),
                  // SizedBox(width: 3,),
                  Text('여기는 닉네임', style: TextStyle(fontSize: 12, color: Color(0xFF141218).withOpacity(0.7)),),
                  Text(' ৹ ', style: TextStyle(fontSize: 12, color: Color(0xFF141218).withOpacity(0.7)),),
                  Text('5분 전', style: TextStyle(fontSize: 10, color: Color(0xFF141218).withOpacity(0.7)),),
                  Spacer(),
                  InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                      child: Row(
                        children: [
                          Icon(Icons.favorite_outline, size: 15, color: Color(0xFF001C3A),),
                          SizedBox(width: 2,),
                          SizedBox(
                              width: 23,
                              child: Text('100k', style: TextStyle(fontSize: 10))
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                '세부내용은 이런식으로 작성되는 내용인데 이렇게 작성하면 어떻게 표현되는지 잘 모르는 그런 느낌의',
                style: TextStyle(fontSize: 14),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}