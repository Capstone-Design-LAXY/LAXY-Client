import 'package:flutter/material.dart';
import 'package:laxy/common/component/background.dart';
import 'package:laxy/common/component/custom/custom_app_bar.dart';
import 'package:laxy/common/component/custom/custom_radio.dart';
import 'package:laxy/common/component/horizontal_expanded.dart';
import 'package:laxy/common/component/list/text_list_tile.dart';
import 'package:laxy/common/component/page_route_with_animation.dart';
import 'package:laxy/screen/main/trends_screen.dart';
import 'package:laxy/screen/my/bookmarked_screen.dart';
import 'package:laxy/screen/user/register_screen.dart';
import 'package:laxy/utils/http_utils.dart';

class MyAccountEditScreen extends StatefulWidget {
  final String nickname;
  final String email;

  const MyAccountEditScreen({
    required this.email,
    required this.nickname,
    super.key
  });

  @override
  State<MyAccountEditScreen> createState() => _MyAccountEditScreenState();
}

class _MyAccountEditScreenState extends State<MyAccountEditScreen> {
  bool isBirthday = false;
  bool isBirthdayValid = true;
  DateTime birthday = DateTime(1900-1-1);
  SingingCharacter? _selectedGender = SingingCharacter.N; // 선택된 성별 저장

  // 생년월일 검증
  bool _isBirthdayValid() {
    if (birthday.year == DateTime(1900-1-1).year &&
        birthday.month == DateTime(1900-1-1).month &&
        birthday.day == DateTime(1900-1-1).day) {
      setState(() {
        isBirthdayValid = false;
      });
      return false;
    }
    setState(() {
      isBirthdayValid = true;
    });
    return true;
  }

  Future<void> _edit() async {
    if (!_isBirthdayValid()) return;
    // 요청 데이터
    String birth = '${birthday.year}-${birthday.month.toString().padLeft(2, '0')}-${birthday.day.toString().padLeft(2, '0')}';
    String gender = _selectedGender.toString().split('.').last; // 성별
    switch (gender) {
      case 'M':
        gender = '남자';
        break;
      case 'F':
        gender = '여자';
        break;
      default:
        gender = '비공개';
        break;
    }
    try {
      await editUser(context,
        birth: birth,
        gender: gender
      );
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => TrendsScreen()), // 홈 화면으로 이동
            (Route<dynamic> route) => false, // 모든 기존 라우트 제거
      );
    } catch (e) {
      print('회원정보수정 오류: $e');
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar(
        title: '회원정보 수정',
      ),
      body: Stack(
        children: [
          Background(rotate: true,),
          // 앱의 다른 콘텐츠
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // 로고 이미지
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/LAXY_highqual_logo.png', // 로고 이미지 경로
                          width: 70,
                          height: 70,
                        ),
                        SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.nickname,
                              style: TextStyle(
                                fontSize: 25,
                                color: Color(0xFFFFFFFF),
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Text(
                              widget.email,
                              style: TextStyle(
                                fontSize: 15,
                                color: Color(0xFFFFFFFF),
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    // 아이디 입력 필드
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          // 생년월일 버튼
                          TextListTile(
                            onPressed: () async {
                              final DateTime? dateTime = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime(2002-1-1),
                                  firstDate: DateTime(1900),
                                  locale: const Locale('ko', 'KR'),
                                  builder: (BuildContext context, Widget? child) {
                                    return Theme(
                                      data: ThemeData.light().copyWith(
                                        primaryColor: Color(0xFF5589D3),
                                        colorScheme: ColorScheme.light(
                                          primary: Color(0xFF5589D3),
                                          onPrimary: Colors.white,
                                          onSurface: Colors.black,
                                        ),
                                        buttonTheme: ButtonThemeData(
                                          textTheme: ButtonTextTheme.primary, // 버튼 텍스트 색상
                                        ),
                                      ),
                                      child: child!,
                                    );
                                  },
                                  lastDate: DateTime(2026));
                              if (dateTime != null) {
                                setState(() {
                                  birthday = dateTime;
                                  isBirthday = true;
                                });
                              }
                            },
                            title: isBirthday
                                ? '${birthday.year} - ${birthday.month} - ${birthday.day}'
                                : '생년월일',
                            fontColor: isBirthday
                                ? Colors.black
                                : null,
                          ),
                          // 생년월일 오류 메시지
                          Visibility(
                              visible: !isBirthdayValid,
                              child: HorizontalExpanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 12, top: 5),
                                  child: Text(
                                    '생년월일을 입력하세요',
                                    style: TextStyle(
                                      color: Color(0xffb00020),
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              )
                          ),
                          SizedBox(
                            height: 56,
                            // 성별 라디오 버튼
                            child: CustomRadio(
                              onChanged: (SingingCharacter? gender) {
                                setState(() {
                                  _selectedGender = gender; // CustomRadio에서 선택된 성별 값을 저장
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    // 로그인 버튼
                    ElevatedButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xFFFFFFFF),
                        foregroundColor: Color(0xFF5589D3),
                      ),
                      onPressed: () {
                        _edit();
                      },
                      child: Text('정보 수정'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
