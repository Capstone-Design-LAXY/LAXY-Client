import 'package:flutter/material.dart';
import 'package:laxy/utils/auth.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        handleLogout();
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
