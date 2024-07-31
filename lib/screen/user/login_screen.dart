import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // 애니메이션 컨트롤러 생성
    _controller = AnimationController(
      vsync: this, // vsync는 성능 최적화를 위해 사용
      duration: Duration(minutes: 6), // 애니메이션 지속 시간 설정
    );

    // 회전 각도에 대한 Tween 생성
    _animation = Tween<double>(
      begin: 0, // 시작 각도
      end: 2 * 3.141, // 끝 각도 (2 * pi는 완전한 원회전을 의미)
    ).animate(_controller);

    // 애니메이션을 무한 반복
    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Image Rotation Animation'),
      // ),
      body: Stack(
        children: [
          // 회전하는 배경 이미지
          Positioned.fill(
            child: OverflowBox(
              maxWidth: double.infinity,
              maxHeight: double.infinity,
              child: Center(
                child: AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: _animation.value,
                      child: Image.asset(
                        'assets/nebula.png', // 이미지 자산 경로
                        width: 1000, // 이미지 너비
                        height: 1000, // 이미지 높이
                        fit: BoxFit.cover, // 이미지가 원래 크기로 표시되도록 설정
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          // 앱의 다른 콘텐츠
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 로고 이미지
                  Image.asset(
                    'assets/LAXY_highqual_logo.png', // 로고 이미지 경로
                    width: 120,
                    height: 120,
                  ),
                  SizedBox(height: 20),
                  // 아이디 입력 필드
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '아이디',
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // 비밀번호 입력 필드
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: TextField(
                      obscureText: true, // 비밀번호 입력을 위해 텍스트 숨김
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '비밀번호',
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // 로그인 버튼
                  ElevatedButton(
                    onPressed: () {
                      // 로그인 버튼 눌렀을 때 동작
                    },
                    child: Text('로그인'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // 위젯이 dispose될 때 애니메이션 컨트롤러를 dispose
    _controller.dispose();
    super.dispose();
  }
}
