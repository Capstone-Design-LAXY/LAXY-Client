import 'package:flutter/material.dart';
import 'package:laxy/common/component/page_route_with_animation.dart';
import 'package:laxy/screen/my/bookmarked_screen.dart';
import 'package:laxy/screen/my/my_page_screen.dart';
import 'package:laxy/screen/tag/community_screen.dart';
import 'package:laxy/screen/tag/tag_screen.dart';

class Globe extends StatefulWidget {
  final Function() onPressed;

  const Globe({
    required this.onPressed,
    super.key,
  });

  @override
  State<Globe> createState() => _GlobeState();
}

class _GlobeState extends State<Globe>
    with SingleTickerProviderStateMixin {

  // TODO: 테마 적용
  @override
  Widget build(BuildContext context) {
    String imagePath;
    double size = 130;

    // 이미지 불러오기
    imagePath = 'assets/globe/LAXY_globe.png';


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
            // 버튼 이펙트가 이미지에 가리지 않도록 덮음
            Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(90),
              ),
              clipBehavior: Clip.hardEdge,
              child: MaterialButton(
                onPressed: widget.onPressed,
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
