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
                    contents: [{"insert":{"image":"https://cafeptthumb-phinf.pstatic.net/MjAyNDA5MTdfMTU0/MDAxNzI2NTE2MDg1NTk5.M_iay-1R8pS0EJ-gByASWK3uIvlzsAgwiOwe2q3Qn0kg.DwXRVt7bVLCKq-b6RdxpGVeMAMNDgvNSA5C8VC1O1eUg.JPEG/Generic-iOS-18-Feature-Real-Mock.jpg?type=w1600"}},{"insert":"\n\n"},{"insert":"iOS 18의 새로운 기능들을 정리해봤습니다.","attributes":{"bold":true}},{"insert":"\n\n직접 해보면서 간단하게 "},{"insert":"요약정리한","attributes":{"background":"#FFFFF59D"}},{"insert":" 것이니 참조만 해주세요~\n\n"},{"insert":{"image":"https://cafeptthumb-phinf.pstatic.net/MjAyNDA5MTdfNTUg/MDAxNzI2NTA4NzY0MDU2.lemsm24MuabUk8kJLYgM0OwHd6bSMdPtoSbWAP2zyYcg.Ljivq_OtVuadsoz-PTgDUHKCgvDRUl1b1UPMmNU1MW8g.PNG/%EC%95%94%ED%98%B8_%EC%95%B1%2C_%EB%B0%B0%EC%97%B4.png?type=w1600"},"attributes":{"style":"width: 392.72727272727275; height: 310.176; "}},{"insert":" "},{"insert":"ios 18 ","attributes":{"color":"#FF1E88E5"}},{"insert":"에서는 홈화면을 자유롭게 꾸밀 수 있습니다.\n새로운 홈화면 꾸미기"},{"insert":"\n","attributes":{"blockquote":true}},{"insert":"앱 배열 사용자화"},{"insert":"\n","attributes":{"list":"bullet"}},{"insert":"암호앱"},{"insert":"\n","attributes":{"list":"bullet"}},{"insert":"앱 색상 변경"},{"insert":"\n","attributes":{"list":"bullet"}},{"insert":"앱과 위젯을 자유롭게 변환하기"},{"insert":"\n","attributes":{"list":"bullet"}},{"insert":"잠금화면 설정 기능 선택, 액션 버튼의 기능 다양화"},{"insert":"\n","attributes":{"indent":1,"list":"bullet"}},{"insert":{"image":"https://cafeptthumb-phinf.pstatic.net/MjAyNDA5MTdfMTI2/MDAxNzI2NTEwMDA3NDAy.0_rVzocXqv7x2VBYMFs1xVM_KXgGUX9R56lEf747YQMg.1uOPiLe74NdSdwFfYDk4aUkfW9owWj4x76_ui9ewsFUg.PNG/KakaoTalk_20240917_030630972.png?type=w1600"},"attributes":{"style":"width: 392.72727272727275; height: 299.2101818181818; "}},{"insert":"제어센터 기능의 다양함\n설정 - 연결된 에어팟 선택 - 머리 제스처 켬\n\n끄덕끄덕🙂‍↕️ 도리도리🙂‍↔️로 걸려오는 전화를 수신 및 거부할 수 있습니다.\n\n"},{"insert":"블로그 출처","attributes":{"link":"https://cafe.naver.com/appleiphone/8515120"}},{"insert":"\n\n"}],
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
                  MaterialPageRoute(builder: (context) => PostViewerScreen(
                    title: 'ios18asdfasd',
                    contents: [{"insert":{"image":"https://cafeptthumb-phinf.pstatic.net/MjAyNDA5MTdfMTU0/MDAxNzI2NTE2MDg1NTk5.M_iay-1R8pS0EJ-gByASWK3uIvlzsAgwiOwe2q3Qn0kg.DwXRVt7bVLCKq-b6RdxpGVeMAMNDgvNSA5C8VC1O1eUg.JPEG/Generic-iOS-18-Feature-Real-Mock.jpg?type=w1600"}},{"insert":"\n\n"},{"insert":"iOS 18의 새로운 기능들을 정리해봤습니다.","attributes":{"bold":true}},{"insert":"\n\n직접 해보면서 간단하게 "},{"insert":"요약정리한","attributes":{"background":"#FFFFF59D"}},{"insert":" 것이니 참조만 해주세요~\n\n"},{"insert":{"image":"https://cafeptthumb-phinf.pstatic.net/MjAyNDA5MTdfNTUg/MDAxNzI2NTA4NzY0MDU2.lemsm24MuabUk8kJLYgM0OwHd6bSMdPtoSbWAP2zyYcg.Ljivq_OtVuadsoz-PTgDUHKCgvDRUl1b1UPMmNU1MW8g.PNG/%EC%95%94%ED%98%B8_%EC%95%B1%2C_%EB%B0%B0%EC%97%B4.png?type=w1600"},"attributes":{"style":"width: 392.72727272727275; height: 310.176; "}},{"insert":" "},{"insert":"ios 18 ","attributes":{"color":"#FF1E88E5"}},{"insert":"에서는 홈화면을 자유롭게 꾸밀 수 있습니다.\n새로운 홈화면 꾸미기"},{"insert":"\n","attributes":{"blockquote":true}},{"insert":"앱 배열 사용자화"},{"insert":"\n","attributes":{"list":"bullet"}},{"insert":"암호앱"},{"insert":"\n","attributes":{"list":"bullet"}},{"insert":"앱 색상 변경"},{"insert":"\n","attributes":{"list":"bullet"}},{"insert":"앱과 위젯을 자유롭게 변환하기"},{"insert":"\n","attributes":{"list":"bullet"}},{"insert":"잠금화면 설정 기능 선택, 액션 버튼의 기능 다양화"},{"insert":"\n","attributes":{"indent":1,"list":"bullet"}},{"insert":{"image":"https://cafeptthumb-phinf.pstatic.net/MjAyNDA5MTdfMTI2/MDAxNzI2NTEwMDA3NDAy.0_rVzocXqv7x2VBYMFs1xVM_KXgGUX9R56lEf747YQMg.1uOPiLe74NdSdwFfYDk4aUkfW9owWj4x76_ui9ewsFUg.PNG/KakaoTalk_20240917_030630972.png?type=w1600"},"attributes":{"style":"width: 392.72727272727275; height: 299.2101818181818; "}},{"insert":"제어센터 기능의 다양함\n설정 - 연결된 에어팟 선택 - 머리 제스처 켬\n\n끄덕끄덕🙂‍↕️ 도리도리🙂‍↔️로 걸려오는 전화를 수신 및 거부할 수 있습니다.\n\n"},{"insert":"블로그 출처","attributes":{"link":"https://cafe.naver.com/appleiphone/8515120"}},{"insert":"\n\n"}],
                  )),
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
