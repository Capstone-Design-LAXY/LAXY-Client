import 'package:flutter/material.dart';
import 'package:laxy/common/component/custom/custom_dropdown_button.dart';
import 'package:laxy/common/component/list/list_header.dart';
import 'package:laxy/common/component/list/post_ranking_list_tile.dart';

class CommunityMainTabView extends StatefulWidget {

  const CommunityMainTabView({
    Key? key,
  }) : super(key: key);

  @override
  State<CommunityMainTabView> createState() => _CommunityMainTabView();
}

const List<String> ageList = <String>['연령', '10대', '20대', '30대', '40대', '50대', '60대'];
const List<String> genderList = <String>['성별', '남자', '여자', '기타'];

class _CommunityMainTabView extends State<CommunityMainTabView>
    with SingleTickerProviderStateMixin {
  String dropdownValueAge1 = ageList.first;
  String dropdownValueGender1 = genderList.first;
  String dropdownValueAge2 = ageList.first;
  String dropdownValueGender2 = genderList.first;


  @override
  Widget build(BuildContext context) {
    // TODO: 테마 적용
    return ListView(
      children: [
        // 헤더
        ListHeader(
          icon: Icons.local_fire_department,
          iconColor: const Color(0xFFFF4949),
          title: '일간 인기 게시글',
          children: [
            CustomDropdownButton(
              items: genderList,
              onChanged: (String? genderValue) {
                setState(() {
                  dropdownValueGender1 = genderValue!;
                });
              },
              valueGender: dropdownValueGender1
            ),
            CustomDropdownButton(
                items: ageList,
                onChanged: (String? ageValue) {
                  setState(() {
                    dropdownValueAge1 = ageValue!;
                  });
                },
                valueGender: dropdownValueAge1
            ),
          ]
        ),
        const Padding(
          padding: EdgeInsets.only(top: 3, bottom: 1),
          child: Divider(height: 1, color: Color(0xFF48464C),),
        ),
        Column(
          children: <Widget>[
            // 리스트
            PostRankingListTile(rank: 1, onPressed: () {},),
            PostRankingListTile(rank: 2, onPressed: () {},),
            PostRankingListTile(rank: 3, onPressed: () {},),
            PostRankingListTile(rank: 4, onPressed: () {},),
            PostRankingListTile(rank: 5, onPressed: () {},),
            PostRankingListTile(rank: 6, onPressed: () {},),
            PostRankingListTile(rank: 7, onPressed: () {},),
            PostRankingListTile(rank: 8, onPressed: () {},),
            PostRankingListTile(rank: 9, onPressed: () {},),
            PostRankingListTile(rank: 10, onPressed: () {},),
          ],
        ),
        const Divider(height: 1, color: Color(0xFF48464C),),
        ListHeader(
            icon: Icons.local_fire_department,
            iconColor: const Color(0xFFFF4949),
            title: '주간 인기 게시글',
            children: [
              CustomDropdownButton(
                  items: genderList,
                  onChanged: (String? genderValue) {
                    setState(() {
                      dropdownValueGender2 = genderValue!;
                    });
                  },
                  valueGender: dropdownValueGender2
              ),
              CustomDropdownButton(
                  items: ageList,
                  onChanged: (String? ageValue) {
                    setState(() {
                      dropdownValueAge2 = ageValue!;
                    });
                  },
                  valueGender: dropdownValueAge2
              ),
            ]
        ),
        const Padding(
          padding: EdgeInsets.only(top: 3, bottom: 1),
          child: Divider(height: 1, color: Color(0xFF48464C),),
        ),
        Column(
          children: <Widget>[
            // 리스트
            PostRankingListTile(rank: 1, onPressed: () {},),
            PostRankingListTile(rank: 2, onPressed: () {},),
            PostRankingListTile(rank: 3, onPressed: () {},),
            PostRankingListTile(rank: 4, onPressed: () {},),
            PostRankingListTile(rank: 5, onPressed: () {},),
            PostRankingListTile(rank: 6, onPressed: () {},),
            PostRankingListTile(rank: 7, onPressed: () {},),
            PostRankingListTile(rank: 8, onPressed: () {},),
            PostRankingListTile(rank: 9, onPressed: () {},),
            PostRankingListTile(rank: 10, onPressed: () {},),
          ],
        )
      ],
    );
  }
}