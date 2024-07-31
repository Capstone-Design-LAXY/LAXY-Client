import 'package:flutter/material.dart';
import 'package:laxy/common/component/custom/custom_drawer_header.dart';
import 'package:laxy/common/component/custom/custom_drawer_item.dart';
import 'package:laxy/common/component/theme_switch.dart';

class CustomDrawer extends StatefulWidget {

  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {

  @override
  Widget build(BuildContext context) {
    // TODO: 테마 적용
    return Drawer(
      backgroundColor: Color(0xFFD4E3FF),
      width: 200,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 10),
            CustomDrawerHeader(title: '즐겨찾기'),
            CustomDrawerItem(name: '자격증', posts: 2100, onPressed: (){},),
            CustomDrawerItem(name: '자격증', posts: 20100, onPressed: (){},),
            CustomDrawerItem(name: '자격증', posts: 1000, onPressed: (){},),
            CustomDrawerItem(name: '자격증', posts: 900, onPressed: (){},),
            CustomDrawerItem(name: '자격증', posts: 1000000000, onPressed: (){},),
            Divider(),
            CustomDrawerHeader(title: '메뉴',),
            CustomDrawerItem(name: '알림', onPressed: (){}, isNew: true),
            CustomDrawerItem(name: '내가 작성한 글', onPressed: (){},),
            CustomDrawerItem(name: '마이페이지', onPressed: (){},),
            CustomDrawerItem(name: '설정', onPressed: (){},),
            Divider(),
            CustomDrawerHeader(title: '추천 커뮤니티',),
            CustomDrawerItem(name: '자격증', posts: 2100, onPressed: (){},),
            CustomDrawerItem(name: '자격증', posts: 20000, onPressed: (){},),
            CustomDrawerItem(name: '자격증', posts: 1000, onPressed: (){},),
            CustomDrawerItem(name: '자격증', posts: 900, onPressed: (){},),
            CustomDrawerItem(name: '자격증', posts: 2100000, onPressed: (){},),
            Spacer(),
            SizedBox(
              height: 30,
              child: Row(
                children: [
                  // 로그아웃 버튼
                  // TODO: 로그아웃 페이지 연결
                  MaterialButton(
                    onPressed: () {},
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 5, top: 1),
                          child: Icon(Icons.logout, size: 20,)
                        ),
                        Text(
                          '로그아웃',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  // 테마 변경 스위치
                  ThemeSwitch(),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}