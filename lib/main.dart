import 'package:flutter/material.dart';
import 'package:laxy/screen/main/mindmap_screen.dart';
import 'package:laxy/screen/main/trends_screen.dart';
import 'package:laxy/screen/temp_start_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'utils/auth_utils.dart';

void main() {
  // CustomThemeMode.instance;
  runApp( _App()); 
  // runApp(TrendsScreen());
}

class _App extends StatefulWidget {

  const _App({super.key});

  @override
  State<_App> createState() => _AppState();
}

class _AppState extends State<_App> {
  bool isLogin = false;

  @override
  void initState() {
    super.initState();
    _checkAccessToken();
  }

  void _checkAccessToken() async{
    bool loginStatus = await isAccessToken();
    setState(() {
      isLogin = loginStatus;
    });
    // print(isLogin);
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(systemNavigationBarDividerColor: Colors.black));
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(systemNavigationBarColor: Colors.black));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Locale('ko', 'KR'), // 한국어로 설정
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        // const Locale('en', 'US'), // 영어
        const Locale('ko', 'KR'), // 한국어
      ],
      home: isLogin? MindmapScreen() : TrendsScreen(),
    );
  }
}