import 'package:flutter/material.dart';
import 'package:laxy/common/component/page_route_with_animation.dart';
import 'package:laxy/screen/my/bookmarked_screen.dart';
import 'package:laxy/screen/my/my_page_screen.dart';
import 'package:laxy/screen/tag/community_screen.dart';
import 'package:laxy/screen/tag/tag_screen.dart';

class OrbitStar extends StatefulWidget {
  final bool? isGlobe;
  final int? grade;
  final bool? showName;
  final String? tagName;
  final int? tId;
  final bool rotation;

  const OrbitStar({
    super.key,
    this.isGlobe = false,
    this.grade = 1,
    this.showName = false,
    this.tagName = "tagName",
    this.tId,
    this.rotation = false,
  });

  @override
  State<OrbitStar> createState() => _OrbitStarState();
}

class _OrbitStarState extends State<OrbitStar>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this);
    controller.repeat(min: 0.0, max: 1.0, period: const Duration(seconds:30));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  // TODO: 테마 적용
  @override
  Widget build(BuildContext context) {
    String imagePath;
    double size = 130;

    // 이미지 불러오기
    if (widget.isGlobe == true) {
      imagePath = 'assets/globe/LAXY_globe.png';
    } else if (widget.grade! > 5) {
      imagePath = 'assets/star/LAXY_star${widget.grade! - 5}.png';
    } else {
      imagePath = 'assets/moon/LAXY_day_moon${widget.grade}.png';
      size = 100;
    }

    // TODO: 작업 필요
    void _handlePress(BuildContext context) {
      if (widget.isGlobe == true) {
        PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(
            BookmarkedScreen());
        Navigator.push(context, pageRouteWithAnimation.fadeTransition());
      } else if (widget.grade! > 5) {
        PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(
            CommunityScreen());
        Navigator.push(context, pageRouteWithAnimation.slideRitghtToLeft());
      } else {
        PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(
            TagScreen());
        Navigator.push(context, pageRouteWithAnimation.slideRitghtToLeft());
      }
    }

    if (widget.rotation) {
      return RotationTransition(
        turns: Tween<double>(begin: 0.0, end: -1.0).animate(controller),
        child: SizedBox(
          width: 130,
          height: 130,
          child: Stack(
              alignment: Alignment.center,
              children: [
                // 별 본체
                Transform.scale(
                  scale: widget.grade! > 5 ? 1 : 0.8,
                  child: Container(
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
                ),
                // 이름 표시
                if (widget.showName == true && widget.isGlobe == false)
                  Positioned(
                    bottom: 0,
                    width: 130,
                    height: 25,
                    child: Text(
                      widget.tagName!,
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
                    splashColor: const Color(0xFF5589D3).withOpacity(0.2),
                    // 클릭 시 효과
                    highlightColor: const Color(0xFF5589D3).withOpacity(
                        0.2), // 클릭 시 효과
                  ),
                ),
              ]
          ),
        ),
      );
    }
    else {
      return SizedBox(
        width: 130,
        height: 130,
        child: Stack(
            alignment: Alignment.center,
            children: [
              // 별 본체
              Transform.scale(
                scale: widget.grade! > 5 ? 1 : 0.74,
                child: Container(
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
              ),
              // 이름 표시
              if (widget.showName == true && widget.isGlobe == false)
                Positioned(
                  bottom: 0,
                  width: 130,
                  height: 25,
                  child: Text(
                    widget.tagName!,
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
                  splashColor: const Color(0xFF5589D3).withOpacity(0.2),
                  // 클릭 시 효과
                  highlightColor: const Color(0xFF5589D3).withOpacity(
                      0.2), // 클릭 시 효과
                ),
              ),
            ]
        ),
      );
    }
  }
}
