import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:laxy/screen/main/trends_screen.dart';

class LoginButton extends StatefulWidget {
  const LoginButton({super.key});

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  String? accessToken = ""; //user의 정보를 저장하기 위한 변수
  static final storage = FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncMethod();
    });
  }

  // 비동기로 FlutterSecureStorage 정보 불러오기
  _asyncMethod() async {
    //read 함수를 통하여 key값에 맞는 정보를 불러오게 됩니다. 이때 불러오는 결과의 타입은 String 타입임을 기억해야 합니다.
    //(데이터가 없을때는 null을 반환을 합니다.)
    accessToken = await storage.read(key: "accessToken");
    print(accessToken);

    //user의 정보가 있다면 바로 로그아웃 페이지로 넝어가게 합니다.
    if (accessToken != null) {
      // Navigator.push(context, MaterialPageRoute(builder: (context) => TrendsScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        storage.delete(key: 'accessToken');
      },
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
    );
  }
}
