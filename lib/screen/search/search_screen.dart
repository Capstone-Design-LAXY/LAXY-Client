import 'package:flutter/material.dart';
import 'package:laxy/common/component/custom/custom_search_delegate.dart';
import 'package:laxy/screen/search/search_community_tab_view.dart';
import 'package:laxy/screen/search/search_post_tab_view.dart';
import 'package:laxy/screen/search/search_tag_tab_view.dart';
import 'package:laxy/screen/search/search_user_tab_view.dart';
import 'package:laxy/screen/tag/community_good_post_tab_view.dart';
import 'package:laxy/common/component/custom/custom_tab_bar.dart';
import 'package:laxy/screen/tag/community_recommend_tab_view.dart';

class SearchScreen extends StatefulWidget {

  const SearchScreen({
    super.key
  });

  @override
  _SearchScreenState createState() => _SearchScreenState();
}


class _SearchScreenState extends State<SearchScreen>
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
        appBar:
        // 텍스트 필드로 만들었을 경우
        AppBar(
          title: Text('SearchPage'),
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
        ),
        body: Container(
          color: Color(0xFFE2E6EA),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                // 탭바
                CustomTabBar(
                    controller: controller,
                    tabs: const <Widget>[
                      Tab(text: '커뮤니티',),
                      Tab(text: '태그',),
                      Tab(text: '게시글',),
                      Tab(text: '사용자',)
                    ]
                ),
                Expanded(
                  child: TabBarView(
                    controller: controller,
                    children: [
                      SearchCommunityTabView(),
                      SearchTagTabView(),
                      SearchPostTabView(),
                      SearchUserTabView(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}