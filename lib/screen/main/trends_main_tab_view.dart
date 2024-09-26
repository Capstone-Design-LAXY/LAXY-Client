import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:laxy/common/component/custom/custom_dropdown_button.dart';
import 'package:laxy/common/component/list/list_header.dart';
import 'package:laxy/common/component/list/post_ranking_list_tile.dart';
import 'package:laxy/utils/utils.dart';

class TrendsMainTabView extends StatefulWidget {

  const TrendsMainTabView({
    Key? key,
  }) : super(key: key);

  @override
  State<TrendsMainTabView> createState() => _TrendsMainTabView();
}

const List<String> ageList = <String>['연령', '10대', '20대', '30대', '40대', '50대', '60대'];
const List<String> genderList = <String>['성별', '남자', '여자', '비공개'];

class _TrendsMainTabView extends State<TrendsMainTabView>
    with SingleTickerProviderStateMixin {
  String dropdownValueAge1 = ageList.first;
  String dropdownValueGender1 = genderList.first;
  String dropdownValueAge2 = ageList.first;
  String dropdownValueGender2 = genderList.first;
  late RankData rankData;

  @override
  void initState() {
    super.initState();

    String jsonString = '''
    {
      "daily": [
        {
          "post_id": 67638,
          "title": "새로운 취미를 찾다: 하루 만에 시작하는 5가지 방법",
          "comments": 6600,
          "like": 7797,
          "change": 18
        },
        {
          "post_id": 80603,
          "title": "아침 루틴으로 성공을 잡는 법: 7가지 필수 팁",
          "comments": 9892,
          "like": 31611,
          "change": 6
        },
        {
          "post_id": 18550,
          "title": "여행의 설렘, 그리고 놓치지 말아야 할 순간들",
          "comments": 1940,
          "like": 95441,
          "change": -9
        },
        {
          "post_id": 70709,
          "title": "시간 관리의 비밀: 효율적으로 일하는 10가지 습관",
          "comments": 4967,
          "like": 149,
          "change": 18
        },
        {
          "post_id": 30827,
          "title": "내가 몰랐던 커피의 세계: 당신이 알아야 할 정보",
          "comments": 8451,
          "like": 12065,
          "change": -5
        },
        {
          "post_id": 40604,
          "title": "내 방을 아늑하게 꾸미는 방법: 인테리어 팁 5선",
          "comments": 7243,
          "like": 24354,
          "change": 0
        },
        {
          "post_id": 60880,
          "title": "운동을 즐기는 방법: 초보자를 위한 가이드",
          "comments": 4920,
          "like": 55483,
          "change": -7
        },
        {
          "post_id": 9754,
          "title": "디지털 디톡스: 일주일 동안 SNS 없이 살아보기",
          "comments": 2296,
          "like": 82045,
          "change": -5
        },
        {
          "post_id": 6668,
          "title": "건강한 식습관으로의 첫걸음: 간단한 레시피 3가지",
          "comments": 7811,
          "like": 60625,
          "change": 9
        },
        {
          "post_id": 60207,
          "title": "어떻게 하면 긍정적으로 생각할 수 있을까? 마음을 다스리는 법",
          "comments": 1427,
          "like": 72095,
          "change": 10
        }
      ],
      "weekly": [
        {
          "post_id": 67638,
          "title": "미래 직업 전망: 2030년에 뜰 산업 7가지",
          "comments": 6600,
          "like": 7797,
          "change": 18
        },
        {
          "post_id": 80603,
          "title": "성공적인 팀워크의 핵심: 협업을 위한 5가지 팁",
          "comments": 9892,
          "like": 31611,
          "change": 6
        },
        {
          "post_id": 18550,
          "title": "집에서 만드는 힐링 스파: DIY 홈케어 방법",
          "comments": 1940,
          "like": 95441,
          "change": -9
        },
        {
          "post_id": 70709,
          "title": "일상 속 작은 변화로 큰 행복 찾기",
          "comments": 4967,
          "like": 149,
          "change": 18
        },
        {
          "post_id": 30827,
          "title": "일 잘하는 사람들의 공통점: 생산성 높이는 습관",
          "comments": 8451,
          "like": 12065,
          "change": -5
        },
        {
          "post_id": 40604,
          "title": "바쁜 아침에도 가능한 10분 아침 요가 루틴",
          "comments": 7243,
          "like": 24354,
          "change": 0
        },
        {
          "post_id": 60880,
          "title": "여행 사진 잘 찍는 법: 초보자를 위한 촬영 팁",
          "comments": 4920,
          "like": 55483,
          "change": -7
        },
        {
          "post_id": 9754,
          "title": "아이디어가 넘치는 사람들의 사고방식: 창의력 향상 비법",
          "comments": 2296,
          "like": 82045,
          "change": -5
        },
        {
          "post_id": 6668,
          "title": "집에서도 가능한 쉬운 운동 루틴: 초보자 가이드",
          "comments": 7811,
          "like": 60625,
          "change": 9
        },
        {
          "post_id": 60207,
          "title": "매일 실천하는 자기 계발 습관: 삶을 바꾸는 작은 행동들",
          "comments": 1427,
          "like": 72095,
          "change": 10
        }
      ]
    }
    ''';

    // JSON 문자열을 RankData 객체로 파싱
    rankData = RankData.fromJson(jsonDecode(jsonString));

    print(rankData.daily.length);
  }


  @override
  Widget build(BuildContext context) {

    List<Widget> _buildDaily() {
      List<Widget> daily = [];
      for (int i = 0; i < rankData.daily.length; i++) {
        daily.add(
            PostRankingListTile(
              title: rankData.daily[i].title,
              rank: i + 1,
              comment: rankData.daily[i].comments,
              like: rankData.daily[i].like,
              shift: rankData.daily[i].change,
              onPressed: () {
                print(rankData.daily[i].postId);
              },
            )
        );
      }
      return daily;
    }

    List<Widget> _buildWeekly() {
      List<Widget> daily = [];
      for (int i = 0; i < rankData.weekly.length; i++) {
        daily.add(
            PostRankingListTile(
              title: rankData.weekly[i].title,
              rank: i + 1,
              comment: rankData.weekly[i].comments,
              like: rankData.weekly[i].like,
              shift: rankData.weekly[i].change,
              onPressed: () {
                print(rankData.weekly[i].postId);
              },
            )
        );
      }
      return daily;
    }

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
          children: _buildDaily(),
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
          children: _buildWeekly(),
        )
      ],
    );
  }
}