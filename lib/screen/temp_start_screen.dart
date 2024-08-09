import 'package:flutter/material.dart';
import 'package:laxy/screen/user/login_screen.dart';
import 'package:laxy/screen/main/mindmap_screen.dart';
import 'package:laxy/screen/post/post_detail_screen.dart';
import 'package:laxy/screen/post/post_register_screen.dart';
import 'package:laxy/screen/post/post_viewer_screen.dart';
import 'package:laxy/screen/tag/community_screen.dart';
import 'package:laxy/screen/tag/tag_screen.dart';
import 'package:laxy/screen/main/trends_screen.dart';

class TempStartScreen extends StatefulWidget {
  const TempStartScreen({super.key});

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
        title: Text('Test Page1'),
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
                  MaterialPageRoute(builder: (context) => CommunityScreen()),
                );
              },
              child: Text('CommunityScreen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PostRegisterScreen()),
                );
              },
              child: Text('PostRegisterScreen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PostDetailScreen()),
                );
              },
              child: Text('PostDetailScreen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PostViewerScreen()),
                );
              },
              child: Text('PostViewerScreen'),
            ),
          ],
        ),
      ),
    );
  }
}
