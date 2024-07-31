import 'package:flutter/material.dart';
import 'package:laxy/common/component/page_route_with_animation.dart';
import 'package:laxy/screen/tag/community_screen.dart';
import 'package:laxy/screen/tag/tag_screen.dart';

class OrbitStar extends StatelessWidget {
  final bool? isGlobe;
  final int? grade;
  final bool? showName;
  final String? tagName;
  final int? tId;

  const OrbitStar({
    super.key,
    this.isGlobe = false,
    this.grade = 1,
    this.showName = false,
    this.tagName = "tagName",
    this.tId,
  });

  // TODO: 테마 적용
  @override
  Widget build(BuildContext context) {
    String imagePath;
    double size = 130;

    // 이미지 불러오기
    if (isGlobe == true) {
      imagePath = 'assets/globe/LAXY_globe.png';
    } else if (grade! > 5) {
      imagePath = 'assets/star/LAXY_star${grade! - 5}.png';
    } else {
      imagePath = 'assets/moon/LAXY_moon${grade}.png';
      size = 100;
    }

    // TODO: 작업 필요
    void _handlePress(BuildContext context) {
      if (isGlobe == true) {
        print('마이페이지 연결 필요');
      } else if (grade! > 5) {
        PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(CommunityScreen());
        Navigator.push(context, pageRouteWithAnimation.slideRitghtToLeft());
      } else {
        PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(TagScreen());
        Navigator.push(context, pageRouteWithAnimation.slideRitghtToLeft());
      }
    }

    return SizedBox(
      width: 130,
      height: 130,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // 별 본체
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(90),
            ),
            clipBehavior: Clip.hardEdge,
            child: Image(
              width: size,
              height: size,
              image: AssetImage(imagePath),
            ),
          ),
          // 이름 표시
          if (showName == true && isGlobe == false)
            Positioned(
              bottom: 0,
              width: 130,
              height: 25,
              child: Text(
                tagName!,
                // TODO: Marquee 적용가능하면 좋을듯
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          // 버튼 이펙트가 이미지에 가리지 않도록 덮음
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(90),
            ),
            clipBehavior: Clip.hardEdge,
            child: MaterialButton(
              onPressed: () => _handlePress(context),
              splashColor: const Color(0xFF5589D3).withOpacity(0.2), // 클릭 시 효과
              highlightColor: const Color(0xFF5589D3).withOpacity(0.2), // 클릭 시 효과
            ),
          ),
        ]
      ),
    );
  }
}
