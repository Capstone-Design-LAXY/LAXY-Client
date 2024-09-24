import 'package:flutter/material.dart';
import 'package:laxy/screen/search/search_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomSearchDelegate extends SearchDelegate {
  TextStyle searchFieldStyle = TextStyle(
    decorationColor: Color(0xFF001C3A),
    fontSize: 18,
  );

  List<String> searchTerms = [];

  Future<void> loadSearchTerms() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedTerms = prefs.getStringList('search_terms');
    if (savedTerms != null) {
      searchTerms = savedTerms; // 저장된 검색어로 초기화
    }
  }

  // 검색어를 로컬 스토리지에 저장하는 함수
  Future<void> saveSearchTerm(String term) async {
    print(term);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedTerms = prefs.getStringList('search_terms') ?? [];
    if (!savedTerms.contains(term)) {
      savedTerms.add(term); // 중복되지 않도록 추가
    }
    await prefs.setStringList('search_terms', savedTerms);
  }

  // 검색 기록 삭제를 위한 함수
  Future<void> deleteSearchTerms() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('search_terms'); // 로컬 저장소에서 검색어 삭제
  }

  void navigateToSearchScreen(BuildContext context, String query) {
    // 현재 Navigator의 스택에서 SearchScreen이 있는지 확인
    bool hasSearchScreen = false;

    Navigator.of(context).popUntil((route) {
      if (route.settings.name == 'SearchScreen') {
        hasSearchScreen = true; // SearchScreen이 발견됨
      }
      return true; // 모든 경로를 pop합니다.
    });

    if (hasSearchScreen) {
      // SearchScreen이 스택에 이미 있을 경우 replace
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => SearchScreen(searchTerm: query), // 검색어 전달
          settings: RouteSettings(name: 'SearchScreen'), // name 설정
        ),
      );
    } else {
      // SearchScreen이 없을 경우 push
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => SearchScreen(searchTerm: query), // 검색어 전달
          settings: RouteSettings(name: 'SearchScreen'), // name 설정
        ),
      );
    }
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFFFFFFFF), // AppBar의 배경색
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none, // 밑줄이 없는 입력 필드
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Colors.blue, // 커서 색상을 파란색으로 설정
      ),
    );
  }



  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.only(right: 4),
        child: IconButton(
          icon: Icon(Icons.clear),
          color: Color(0xFF001C3A),
          onPressed: () {
            query = '';
          }
        ),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
        color: Color(0xFF001C3A),
      onPressed: () {
        close(context, null);
      }
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.trim().isNotEmpty) {
      searchTerms.add(query);
      // 로컬 스토리지에 검색어 저장
      saveSearchTerm(query);

      Future.microtask(() {
        // SearchScreen으로 이동
        close(context, null); // SearchDelegate를 닫음
        navigateToSearchScreen(context, query);
      });

      // 비어있는 컨테이너 반환 (탐색 중인 동안에 아무것도 보여주지 않음)
      return Container();
    }
    // 비어있는 컨테이너 반환 (탐색 중인 동안에 아무것도 보여주지 않음)
    // query가 공백인 경우, 사용자에게 알림을 표시할 수 있습니다.
    query = '';
    return Container(
      color: Color(0xFFE2E6EA),
      child: Center(
        child: Text(
          '검색어를 입력해주세요.',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // 검색어 목록을 로드하는 비동기 작업
    loadSearchTerms();

    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if(fruit.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(fruit);
      }
    }
    return Container(
      color: Color(0xFFE2E6EA),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: matchQuery.length,
              itemBuilder: (context, index) {
                var result = matchQuery[index];
                return Material(
                  elevation: 4,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey, // 경계선 색상
                          width: 1, // 경계선 두께
                        ),
                      ),
                    ),
                    child: ListTile(
                      title: Text(result, maxLines: 1, overflow: TextOverflow.ellipsis,),
                      tileColor: Color(0xFFF6F8FA),
                      onTap: () {
                        query = result;
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            style: TextButton.styleFrom(
              backgroundColor: Color(0xFFFFFFFF),
              foregroundColor: Color(0xFF5589D3),
            ),
            onPressed: () async {
              // 검색 기록 삭제 로직 구현
              await deleteSearchTerms(); // 로컬 저장소에서 검색어 삭제
              close(context, null); // SearchDelegate를 닫음
              showSearch(context: context, delegate: CustomSearchDelegate());
            },
            child: Text('검색 기록 삭제'),
          ),
          SizedBox(height: 10,)
        ],
      ),
    );
  }
}