import 'package:flutter/material.dart';
import 'package:laxy/screen/main/mindmap_screen.dart';
import 'package:laxy/screen/main/trends_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:laxy/utils/utils.dart';

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
  bool? isLogin;

  @override
  void initState() {
    super.initState();
    _checkAccessToken();
  }

  void _checkAccessToken() async{
    bool loginStatus = await isAccessToken();
    adjustTime(context);
    setState(() {
      isLogin = loginStatus;
    });
    // print(isLogin);
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if (isLogin == null) {
      return Center(child: CircularProgressIndicator()); // 데이터 로드 중 로딩 인디케이터 표시
    }
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
      home: isLogin! ? MindmapScreen() : TrendsScreen(),
    );
  }
}