import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:laxy/common/component/custom/custom_dropdown_button.dart';
import 'package:laxy/common/component/list/list_header.dart';
import 'package:laxy/common/component/list/post_ranking_list_tile.dart';
import 'package:laxy/common/component/page_route_with_animation.dart';
import 'package:laxy/common/var.dart';
import 'package:laxy/screen/post/post_detail_screen.dart';
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
    rankData = trendsMainData;

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
                PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(
                    PostDetailScreen(postId: rankData.daily[i].postId,));
                Navigator.push(context, pageRouteWithAnimation.slideRitghtToLeft());
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
                PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(
                    PostDetailScreen(postId: rankData.weekly[i].postId,));
                Navigator.push(context, pageRouteWithAnimation.slideRitghtToLeft());
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