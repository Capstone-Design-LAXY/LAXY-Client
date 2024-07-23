import 'package:flutter/material.dart';
import 'package:laxy/common/component/custom_drawer_header.dart';
import 'package:laxy/common/component/custom_drawer_item.dart';

class CustomDrawer extends StatefulWidget {

  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool dark_mode = false;

  final MaterialStateProperty<Icon?> thumbIcon =
  MaterialStateProperty.resolveWith<Icon?>(
        (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.mode_night_outlined, color: Color(0xFFFC9112),);
      }
      return const Icon(Icons.light_mode, color: Color(0xFFFC9112),);
    },
  );


  final MaterialStateProperty<Color?> trackColor =
  MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return Color(0xFF141218);
      }
      return Color(0xFFFFFFFF);
    },
  );

  final MaterialStateProperty<Color?> thumbColor =
  MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return Color(0xFFFFFFFF);
      }
      return Color(0xFF141218);
    },
  );

  final MaterialStateProperty<Color?> overlayColor =
  MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        // return Colors.amber.withOpacity(0.54);
        return null;
      }
      if (states.contains(MaterialState.disabled)) {
        // return Colors.grey.shade400;
        return null;
      }
      return null;
    },
  );

  @override
  Widget build(BuildContext context) {
    // TODO: 테마 적용
    return Drawer(
      backgroundColor: Color(0xFFD4E3FF),
      width: 200,
      child: Container(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: 10,
              child: Container(
                // color: Colors.amber,
              ),
            ),
            CustomDrawerHeader(title: '즐겨찾기'),
            CustomDrawerItem(name: '자격증', posts: 2100,),
            CustomDrawerItem(name: '자격증', posts: 20000,),
            CustomDrawerItem(name: '자격증', posts: 1000,),
            CustomDrawerItem(name: '자격증', posts: 900,),
            CustomDrawerItem(name: '자격증', posts: 2100000,),
            Divider(),
            CustomDrawerHeader(title: '메뉴',),
            CustomDrawerItem(name: '알림',),
            CustomDrawerItem(name: '알림',),
            CustomDrawerItem(name: '알림',),
            CustomDrawerItem(name: '알림',),
            Divider(),
            CustomDrawerHeader(title: '추천 커뮤니티',),
            CustomDrawerItem(name: '자격증', posts: 2100,),
            CustomDrawerItem(name: '자격증', posts: 20000,),
            CustomDrawerItem(name: '자격증', posts: 1000,),
            CustomDrawerItem(name: '자격증', posts: 900,),
            CustomDrawerItem(name: '자격증', posts: 2100000,),
            Expanded(child: SizedBox()),
            Container(
              // color: Colors.blue,
              height: 30,
              child: Row(
                children: [
                  // 로그아웃 버튼
                  MaterialButton(
                    onPressed: () {},
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                    child: Row(
                      children: [
                        Padding(
                          // color: Colors.amber,
                          padding: const EdgeInsets.only(right: 5, top: 1),
                          child: Icon(Icons.logout, size: 20,)
                        ),
                        Container(
                          // color: Colors.red,
                          child: Text(
                            '로그아웃',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  // 테마 변경 스위치
                  Transform.scale(
                    scale: 0.9,
                    child: Switch(
                      thumbIcon: thumbIcon,
                      value: dark_mode,
                      trackColor: trackColor,
                      thumbColor: thumbColor,
                      onChanged: (bool value) {
                        setState(() {
                          dark_mode = value;
                        });
                      },
                    ),
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}