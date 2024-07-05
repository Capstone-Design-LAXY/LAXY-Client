import 'package:flutter/material.dart';
import 'package:laxy/common/component/post_ranking_list_tile.dart';

class TrendsMainTabView extends StatefulWidget {

  const TrendsMainTabView({
    Key? key,
  }) : super(key: key);

  @override
  State<TrendsMainTabView> createState() => _TrendsMainTabView();
}

enum Main{ mindMap, trends }
const List<String> ageList = <String>['연령', '10대', '20대', '30대', '40대', '50대', '60대'];
const List<String> genderList = <String>['성별', '남자', '여자', '기타'];

class _TrendsMainTabView extends State<TrendsMainTabView>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  Main mainView = Main.trends;
  String dropdownValueAge = ageList.first;
  String dropdownValueGender = genderList.first;

  @override
  void initState() {
    super.initState();

    controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: 테마 적용
    return ListView(
      children: [
        // 헤더
        Divider(height: 1, color: Color(0xFF48464C),),
        Container(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 2, right: 2),
                child: Icon(Icons.local_fire_department, color: Color(0xFFFF4949), size: 30,),
              ),
              Text(
                '일간 인기 게시글',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w200
                ),
              ),
              Expanded(child: SizedBox(),),
              // 드롭다운
              Container(
                  child: DropdownButton<String>(
                    value: dropdownValueGender,
                    underline: SizedBox.shrink(),
                    icon: const Icon(Icons.expand_more, color: Color(0xFF001C3A),),
                    style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF141218)
                    ),
                    dropdownColor: Color(0xFFFFFFFF),
                    isDense: true,
                    onChanged: (String? genderValue) {
                      setState(() {
                        dropdownValueGender = genderValue!;
                      });
                    },
                    items: genderList.map<DropdownMenuItem<String>>((String genderValue) {
                      return DropdownMenuItem<String>(
                        value: genderValue,
                        child: Text(genderValue),
                      );
                    }).toList(),
                  )
              ),
              Container(
                  child: DropdownButton<String>(
                    value: dropdownValueAge,
                    underline: SizedBox.shrink(),
                    icon: const Icon(Icons.expand_more, color: Color(0xFF001C3A),),
                    style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF141218)
                    ),
                    dropdownColor: Color(0xFFFFFFFF),
                    isDense: true,
                    onChanged: (String? ageValue) {
                      setState(() {
                        dropdownValueAge = ageValue!;
                      });
                    },
                    items: ageList.map<DropdownMenuItem<String>>((String ageValue) {
                      return DropdownMenuItem<String>(
                        value: ageValue,
                        child: Text(ageValue),
                      );
                    }).toList(),
                  )
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 3, bottom: 1),
          child: Divider(height: 1, color: Color(0xFF48464C),),
        ),
        Column(
          children: <Widget>[
            // 리스트
            PostRankingListTile(rank: 1,),
            PostRankingListTile(rank: 2,),
            PostRankingListTile(rank: 3,),
            PostRankingListTile(rank: 4,),
            PostRankingListTile(rank: 5,),
            PostRankingListTile(rank: 6,),
            PostRankingListTile(rank: 7,),
            PostRankingListTile(rank: 8,),
            PostRankingListTile(rank: 9,),
            PostRankingListTile(rank: 10,),
          ],
        ),
        Divider(height: 1, color: Color(0xFF48464C),),
        Container(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5,left: 2, right: 2),
                child: Icon(Icons.local_fire_department, color: Color(0xFFFF4949), size: 30,),
              ),
              Text(
                '주간 인기 게시글',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w200
                ),
              ),
              Expanded(child: SizedBox(),),
              // 드롭다운
              Container(
                  child: DropdownButton<String>(
                    value: dropdownValueGender,
                    underline: SizedBox.shrink(),
                    icon: const Icon(Icons.expand_more, color: Color(0xFF001C3A),),
                    style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF141218)
                    ),
                    dropdownColor: Color(0xFFFFFFFF),
                    isDense: true,
                    onChanged: (String? genderValue) {
                      setState(() {
                        dropdownValueGender = genderValue!;
                      });
                    },
                    items: genderList.map<DropdownMenuItem<String>>((String genderValue) {
                      return DropdownMenuItem<String>(
                        value: genderValue,
                        child: Text(genderValue),
                      );
                    }).toList(),
                  )
              ),
              Container(
                  child: DropdownButton<String>(
                    value: dropdownValueAge,
                    underline: SizedBox.shrink(),
                    icon: const Icon(Icons.expand_more, color: Color(0xFF001C3A),),
                    style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF141218)
                    ),
                    dropdownColor: Color(0xFFFFFFFF),
                    isDense: true,
                    onChanged: (String? ageValue) {
                      setState(() {
                        dropdownValueAge = ageValue!;
                      });
                    },
                    items: ageList.map<DropdownMenuItem<String>>((String ageValue) {
                      return DropdownMenuItem<String>(
                        value: ageValue,
                        child: Text(ageValue),
                      );
                    }).toList(),
                  )
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 3, bottom: 1),
          child: Divider(height: 1, color: Color(0xFF48464C),),
        ),
        Column(
          children: <Widget>[
            // 리스트
            PostRankingListTile(rank: 1,),
            PostRankingListTile(rank: 2,),
            PostRankingListTile(rank: 3,),
            PostRankingListTile(rank: 4,),
            PostRankingListTile(rank: 5,),
            PostRankingListTile(rank: 6,),
            PostRankingListTile(rank: 7,),
            PostRankingListTile(rank: 8,),
            PostRankingListTile(rank: 9,),
            PostRankingListTile(rank: 10,),
          ],
        )
      ],
    );
  }
}