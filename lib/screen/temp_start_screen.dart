import 'package:flutter/material.dart';
import 'package:laxy/screen/my/bookmarked_screen.dart';
import 'package:laxy/screen/my/my_account_screen.dart';
import 'package:laxy/screen/my/my_page_screen.dart';
import 'package:laxy/screen/post/post_edit_screen.dart';
import 'package:laxy/screen/search/search_screen.dart';
import 'package:laxy/screen/user/login_screen.dart';
import 'package:laxy/screen/main/mindmap_screen.dart';
import 'package:laxy/screen/post/post_detail_screen.dart';
import 'package:laxy/screen/post/post_register_screen.dart';
import 'package:laxy/screen/post/post_viewer_screen.dart';
import 'package:laxy/screen/tag/community_screen.dart';
import 'package:laxy/screen/tag/tag_screen.dart';
import 'package:laxy/screen/main/trends_screen.dart';
import 'package:laxy/screen/user/register_screen.dart';

class TempStartScreen extends StatefulWidget {
  const TempStartScreen({super.key});

  @override
  State<TempStartScreen> createState() => _TempStartScreenState();
}

class _TempStartScreenState extends State<TempStartScreen>
  with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();

    controller = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Page1'),
      ),
      body: Center(
        child: Wrap(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TrendsScreen()),
                );
              },
              child: Text('TrendsScreen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MindmapScreen()),
                );
              },
              child: Text('MindmapScreen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TagScreen(tagName: 'tagName', tagId: 123,)),
                );
              },
              child: Text('TagScreen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CommunityScreen(tagName: 'tagName', tagId: 123,)),
                );
              },
              child: Text('CommunityScreen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PostRegisterScreen()),
                );
              },
              child: Text('PostRegisterScreen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PostEditScreen(
                    postId: 123123,
                    title: '게시글 제목 예시',
                    tagList: ['이런', '저런'],
                    contents: r'[{"insert":"이거 "},{"insert":"에뮬레이터가","attributes":{"bold":true}},{"insert":" 메모리를 아주 많이 잡아 먹습니다\n예를 "},{"insert":"들자면","attributes":{"color":"#FF1E88E5"}},{"insert":" 이런 "},{"insert":"느낌집니다","attributes":{"background":"#FFEC407A"}},{"insert":".\n\n이게 어이없게 자동 수정이 들어가 있어서 \n계속 단어를 수정해주는데요"},{"insert":"\n","attributes":{"blockquote":true}},{"insert":"여기서 사진을 클립보드에서 붙여넣어보겠습니ㅏㄷ"},{"insert":"\n","attributes":{"list":"bullet"}},{"insert":{"image":"https://picsum.photos/200"}},{"insert":"ㅇ\n좋습니다 이제 사진을 넣었군요\n"}]',
                  )),
                );
              },
              child: Text('PostEditScreen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PostDetailScreen(postId: 11312321,)),
                );
              },
              child: Text('PostDetailScreen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PostViewerScreen()),
                );
              },
              child: Text('PostViewerScreen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchScreen(searchTerm: 'searchTerm',)),
                );
              },
              child: Text('SearchScreen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Text('LoginScreen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterScreen()),
                );
              },
              child: Text('RegisterScreen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyPageScreen()),
                );
              },
              child: Text('MyPageScreen'),
            ),
          ],
        ),
      ),
    );
  }
}
