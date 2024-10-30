import 'package:flutter/material.dart';
import 'package:laxy/common/component/custom/custom_search_delegate.dart';
import 'package:laxy/common/component/list/list_header.dart';
import 'package:laxy/common/component/list/tag_list_tile.dart';
import 'package:laxy/common/component/page_route_with_animation.dart';
import 'package:laxy/screen/search/search_community_tab_view.dart';
import 'package:laxy/screen/search/search_post_tab_view.dart';
import 'package:laxy/screen/search/search_tag_tab_view.dart';
import 'package:laxy/screen/search/search_user_tab_view.dart';
import 'package:laxy/common/component/custom/custom_tab_bar.dart';
import 'package:laxy/screen/tag/community_screen.dart';
import 'package:laxy/screen/tag/tag_screen.dart';
import 'package:laxy/utils/http_utils.dart';
import 'package:laxy/utils/utils.dart';

class SearchScreen extends StatefulWidget {
  final String searchTerm; // 검색어를 전달받기 위한 변수

  const SearchScreen({
    required this.searchTerm,
    super.key
  });

  @override
  _SearchScreenState createState() => _SearchScreenState();
}


class _SearchScreenState extends State<SearchScreen>
    with SingleTickerProviderStateMixin {
  // late TabController controller;
  List<Tag>? data;


  @override
  void initState() {
    super.initState();
    _loadData();
    // controller = TabController(length: 4, vsync: this);
  }

  Future<void> _loadData() async{
    data = await searchTag(context, query: widget.searchTerm);
    setState(() {});
  }

  @override
  void dispose() {
    // controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (data == null) {
      return Center(child: CircularProgressIndicator()); // 데이터 로드 중 로딩 인디케이터 표시
    }

    List<Widget> _buildTags() {
      List<Widget> tags = [];
      for (int i = 0; i < data!.length; i++) {
        tags.add(
            TagListTile(
              tagId: data![i].tagId,
              name: data![i].name,
              postCount: data![i].postCount,
              bookmarkCount: data![i].bookmarkCount,
              grade: data![i].grade,
              onPressed: () {
                if(data![i].grade <= 5){
                  PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(TagScreen(tagId: data![i].tagId, tagName: data![i].name,));
                  Navigator.push(context, pageRouteWithAnimation.slideRightToLeft());
                }
                else {
                  PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(CommunityScreen(tagId: data![i].tagId, tagName: data![i].name,));
                  Navigator.push(context, pageRouteWithAnimation.slideRightToLeft());
                }
              },
            )
        );
      }
      return tags;
    }

    return Scaffold(
        appBar:
        // 텍스트 필드로 만들었을 경우
        AppBar(
          title: Text(widget.searchTerm),
          titleSpacing: 1,
          leading: IconButton(onPressed: () {Navigator.of(context).pop();}, icon: const Icon(Icons.arrow_back),),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: CustomSearchDelegate()
                );
              },
            ),
            const SizedBox(width: 4,)
          ],
          backgroundColor: const Color(0xFFFFFFFF),
          foregroundColor: const Color(0xFF141218),
          surfaceTintColor: const Color(0xFFFFFFFF),
          elevation: 1.0,  // 그림자 추가
          shadowColor: Color(0xFF000000),
        ),
        body: Container(
          color: Color(0xFFE2E6EA),
          // color: Colors.white,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    ListHeader(
                      title: "검색 결과",
                      icon: Icons.tag,
                      iconColor: Color(0xFF5589D3),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 3, bottom: 1),
                      child: Divider(height: 1, color: Color(0xFF48464C),),
                    ),
                    Column(
                      children: _buildTags(),
                    ),
                    if(data!.isEmpty) Center(child: Text('검색결과 없음', style: TextStyle(fontSize: 16, color: Colors.grey),),),
                  ],
                ),
              ),
            ],
          ),
        )
        /// 검색 결과가 커뮤니티, 태그, 게시글, 사용자로 나눠졌을 경우
        // body: Container(
        //   color: Color(0xFFE2E6EA),
        //   child: Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: 20),
        //     child: Column(
        //       children: [
        //         // 탭바
        //         CustomTabBar(
        //             controller: controller,
        //             tabs: const <Widget>[
        //               Tab(text: '커뮤니티',),
        //               Tab(text: '태그',),
        //               Tab(text: '게시글',),
        //               Tab(text: '사용자',)
        //             ]
        //         ),
        //         Expanded(
        //           child: TabBarView(
        //             controller: controller,
        //             children: [
        //               SearchCommunityTabView(searchTerm: widget.searchTerm,),
        //               SearchTagTabView(searchTerm: widget.searchTerm,),
        //               SearchPostTabView(searchTerm: widget.searchTerm,),
        //               SearchUserTabView(searchTerm: widget.searchTerm,),
        //             ],
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // )
    );
  }
}