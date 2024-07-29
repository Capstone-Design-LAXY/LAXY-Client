import 'package:flutter/material.dart';

class OrbitStar extends StatelessWidget {
  final bool? isGlobe;
  final bool? isCommunity;
  final int? grade;
  final bool? nameTag;
  final String? name;

  const OrbitStar({
    super.key,
    this.isGlobe = false,
    this.isCommunity = false,
    this.grade = 1,
    this.nameTag = false,
    this.name = "tagName"
  });

  @override
  Widget build(BuildContext context) {
    String imagePath;
    double size = 130;
    if (isGlobe == true) {
      imagePath = 'assets/globe/LAXY_globe.png';
    } else if (isCommunity == true) {
      imagePath = 'assets/star/LAXY_star_${grade}.png';
    } else {
      imagePath = 'assets/moon/LAXY_moon${grade}.png';
      size = 110;
    }

    return Container(
      width: 130,
      height: 130,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            width: 130,
            child: Image(
              image: AssetImage(imagePath),
              width: size,
              height: size,
            ),
          ),

          if (nameTag == true && isGlobe == false) // 조건부로 두 번째 Positioned 위젯을 렌더링
            Positioned(
              bottom: 0,
              width: 130,
              height: 27,
              child: Text(
                name ?? "tagName", // name이 null인 경우 기본값 사용
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center, // 중앙 정렬
                style: TextStyle(color: Colors.white, fontSize: 20), // 텍스트 스타일
              ),
            ),
        ]
      ),
    );
  }
}
