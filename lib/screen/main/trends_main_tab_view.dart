import 'package:flutter/material.dart';
import 'package:laxy/common/component/custom/custom_dropdown_button.dart';
import 'package:laxy/common/component/list/list_header.dart';
import 'package:laxy/common/component/list/post_ranking_list_tile.dart';

class TrendsMainTabView extends StatefulWidget {

  const TrendsMainTabView({
    Key? key,
  }) : super(key: key);

  @override
  State<TrendsMainTabView> createState() => _TrendsMainTabView();
}

const List<String> ageList = <String>['연령', '10대', '20대', '30대', '40대', '50대', '60대'];
const List<String> genderList = <String>['성별', '남자', '여자', '기타'];

class _TrendsMainTabView extends State<TrendsMainTabView>
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
        const Column(
          children: <Widget>[
            // 리스트
            PostRankingListTile(rank: 1,),
            PostRankingListTile(rank: 2,),
            PostRankingListTile(rank: 3,),
            PostRankingListTile(rank: 4,),
            PostRankingListTile(rank: 5,),
            PostRankingListTile(rank: 6, shift: -3,),
            PostRankingListTile(rank: 7,),
            PostRankingListTile(rank: 8,),
            PostRankingListTile(rank: 9,),
            PostRankingListTile(rank: 10,),
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
          padding: const EdgeInsets.only(top: 3, bottom: 1),
          child: Divider(height: 1, color: Color(0xFF48464C),),
        ),
        const Column(
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