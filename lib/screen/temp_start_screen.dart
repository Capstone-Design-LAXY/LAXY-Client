import 'package:flutter/material.dart';
import 'package:laxy/screen/login_screen.dart';
import 'package:laxy/screen/trends_screen.dart';

class TempStartScreen extends StatelessWidget {
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
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => ThemeTest()),
            //     );
            //   },
            //   child: Text('Go to Page 2'),
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => Page3()),
            //     );
            //   },
            //   child: Text('Go to Page 3'),
            // ),
          ],
        ),
      ),
    );
  }
}