import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:laxy/common/component/custom/custom_dropdown_button.dart';
import 'package:laxy/common/component/list/list_header.dart';
import 'package:laxy/common/component/list/post_ranking_list_tile.dart';
import 'package:laxy/common/component/page_route_with_animation.dart';
import 'package:laxy/screen/post/post_detail_screen.dart';
import 'package:laxy/utils/http_utils.dart';
import 'package:laxy/utils/utils.dart';

class TrendsMainTabView extends StatefulWidget {

  const TrendsMainTabView({
    Key? key,
  }) : super(key: key);

  @override
  State<TrendsMainTabView> createState() => _TrendsMainTabView();
}

// const List<String> ageList = <String>['연령', '10대', '20대', '30대', '40대', '50대', '60대'];
// const List<String> genderList = <String>['성별', '남자', '여자', '비공개'];

class _TrendsMainTabView extends State<TrendsMainTabView>
    with SingleTickerProviderStateMixin {
  // String dropdownValueAge1 = ageList.first;
  // String dropdownValueGender1 = genderList.first;
  // String dropdownValueAge2 = ageList.first;
  // String dropdownValueGender2 = genderList.first;
  List<Post>? daily;
  List<Post>? weekly;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async{
    daily = await trendMainDaily(context);
    weekly = await trendMainWeekly(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if(daily == null || weekly == null) {
      return Center(child: CircularProgressIndicator()); // 데이터 로드 중 로딩 인디케이터 표시
    }

    List<Widget> _buildDaily() {
      List<Widget> data = [];
      int len = daily!.length > 10 ? 10 : daily!.length;
      for (int i = 0; i < len; i++) {
        data.add(
            PostRankingListTile(
              title: daily![i].title,
              rank: i + 1,
              commentCount: daily![i].commentCount,
              likeCount: daily![i].likeCount,
              // shift: daily[i].change,
              onPressed: () {
                PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(
                    PostDetailScreen(postId: daily![i].postId,));
                Navigator.push(context, pageRouteWithAnimation.slideRightToLeft());
              },
            )
        );
      }
      return data;
    }

    List<Widget> _buildWeekly() {
      List<Widget> data = [];
      int len = weekly!.length > 10 ? 10 : weekly!.length;
      for (int i = 0; i < len; i++) {
        data.add(
            PostRankingListTile(
              title: weekly![i].title,
              rank: i + 1,
              commentCount: weekly![i].commentCount,
              likeCount: weekly![i].likeCount,
              // shift: weekly[i].change,
              onPressed: () {
                PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(
                    PostDetailScreen(postId: weekly![i].postId,));
                Navigator.push(context, pageRouteWithAnimation.slideRightToLeft());
              },
            )
        );
      }
      return data;
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
            // CustomDropdownButton(
            //   items: genderList,
            //   onChanged: (String? genderValue) {
            //     setState(() {
            //       dropdownValueGender1 = genderValue!;
            //     });
            //   },
            //   valueGender: dropdownValueGender1
            // ),
            // CustomDropdownButton(
            //     items: ageList,
            //     onChanged: (String? ageValue) {
            //       setState(() {
            //         dropdownValueAge1 = ageValue!;
            //       });
            //     },
            //     valueGender: dropdownValueAge1
            // ),
          ]
        ),
        const Padding(
          padding: EdgeInsets.only(top: 3, bottom: 1),
          child: Divider(height: 1, color: Color(0xFF48464C),),
        ),
         Column(
          children: _buildDaily(),
        ),
        if(daily!.isEmpty) Center(child: Text('일간 인기 게시글 없음', style: TextStyle(fontSize: 16, color: Colors.grey),),),
        const Divider(height: 1, color: Color(0xFF48464C),),
        ListHeader(
            icon: Icons.local_fire_department,
            iconColor: const Color(0xFFFF4949),
            title: '주간 인기 게시글',
            children: [
              // CustomDropdownButton(
              //     items: genderList,
              //     onChanged: (String? genderValue) {
              //       setState(() {
              //         dropdownValueGender2 = genderValue!;
              //       });
              //     },
              //     valueGender: dropdownValueGender2
              // ),
              // CustomDropdownButton(
              //     items: ageList,
              //     onChanged: (String? ageValue) {
              //       setState(() {
              //         dropdownValueAge2 = ageValue!;
              //       });
              //     },
              //     valueGender: dropdownValueAge2
              // ),
            ]
        ),
        const Padding(
          padding: EdgeInsets.only(top: 3, bottom: 1),
          child: Divider(height: 1, color: Color(0xFF48464C),),
        ),
        Column(
          children: _buildWeekly(),
        ),
        if(weekly!.isEmpty) Center(child: Text('주간 인기 게시글 없음', style: TextStyle(fontSize: 16, color: Colors.grey),),),
      ],
    );
  }
}