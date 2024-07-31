import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:laxy/screen/temp_start_screen.dart';

void main() {
  // CustomThemeMode.instance;
  runApp( _App()); 
  // runApp(TrendsScreen());
}

class _App extends StatelessWidget {
  const _App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(systemNavigationBarDividerColor: Colors.black));
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(systemNavigationBarColor: Colors.black));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: Scaffold(
      //   body: Column(
      //     children: [
      //       CustomFloatingActionButton(icon: Icons.search, onPressed: () => {},),
      //     ],
      //   ),
      // home: TrendsScreen(),
      home: TempStartScreen(),
    );
  }
}