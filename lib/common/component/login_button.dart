import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:laxy/common/component/page_route_with_animation.dart';
import 'package:laxy/screen/user/login_screen.dart';

class LoginButton extends StatelessWidget {
  final bool isLogin;
  const LoginButton({
    this.isLogin = false,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        if (isLogin){
          Navigator.pop(context);
          FlutterSecureStorage().delete(key: 'accessToken');
        }
        else {
          Navigator.pop(context);
          PageRouteWithAnimation pageRouteWithAnimation = PageRouteWithAnimation(LoginScreen());
          Navigator.push(context, pageRouteWithAnimation.slideRitghtToLeft());
        }
      },
      elevation: 0,
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
      child: Row(
        children: [
          Padding(
              padding: const EdgeInsets.only(right: 5, top: 1),
              child: Icon(
                isLogin? Icons.logout : Icons.login,
                size: 20,
              )
          ),
          Text(
            isLogin ? '로그아웃' : '로그인',
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}