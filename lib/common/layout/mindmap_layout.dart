import 'package:flutter/material.dart';
import 'package:laxy/common/component/custom/custom_floating_action_button.dart';
import 'package:laxy/common/component/custom/custom_segment_button.dart';
import 'package:laxy/common/component/page_route_with_animation.dart';
import 'package:laxy/screen/post/post_register_screen.dart';

class MindmapLayout extends StatelessWidget {
  const MindmapLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 10),
      child: Column(
        children: [
          // 상단 FAB, segment Button 자리
          Row(
            children: [
              Hero(
                tag: 'Drawer',
                child: Builder(
                    builder: (context) {
                      return CustomFloatingActionButton(
                          onPressed: () {Scaffold.of(context).openDrawer();},
                          icon: Icons.menu
                      );
                    }
                ),
              ),
              Spacer(),
              // TODO: 컴포넌트화 필요
              // 세그먼트 버튼 (크기 다음과 같이 고정)
              SizedBox(
                height: 40,
              ),
              Spacer(),
              // TODO: 게시글 작성 버튼 연결
              Hero(
                tag: 'PostRegister',
                child: CustomFloatingActionButton(
                  icon: Icons.mode_outlined,
                  onPressed: () {
                    PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(PostRegisterScreen());
                    Navigator.push(context, pageRouteWithAnimation.slideRitghtToLeft());
                  },
                ),
              ),
              SizedBox(width: 13,),
              // TODO: 검색 버튼 연결
              Hero(
                tag: 'Search',
                child: CustomFloatingActionButton(
                  icon: Icons.search,
                  onPressed: () {print('search');},
                ),
              ),
            ],
          ),
          Spacer(),
          CustomSegmentButton(initTrends: false,)
        ],
      ),
    );
  }
}
