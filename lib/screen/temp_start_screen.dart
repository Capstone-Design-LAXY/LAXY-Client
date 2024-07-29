import 'package:flutter/material.dart';
import 'package:laxy/screen/community_screen.dart';
import 'package:laxy/screen/login_screen.dart';
import 'package:laxy/screen/mindmap_detail_screen.dart';
import 'package:laxy/screen/mindmap_screen.dart';
import 'package:laxy/screen/tag_screen.dart';
import 'package:laxy/screen/trends_screen.dart';

class TempStartScreen extends StatefulWidget {
  @override
  State<TempStartScreen> createState() => _TempStartScreenState();
}

class _TempStartScreenState extends State<TempStartScreen>
  with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();

    controller = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TrendsScreen()),
                );
              },
              child: Text('TrendsScreen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Text('LoginScreen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TagScreen()),
                );
              },
              child: Text('TagScreen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MindmapScreen()),
                );
              },
              child: Text('MindmapScreen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MindmapDetailScreen()),
                );
              },
              child: Text('MindmapDetailScreen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CommunityScreen()),
                );
              },
              child: Text('CommunityScreen'),
            ),
          ],
        ),
      ),
    );
  }
}
