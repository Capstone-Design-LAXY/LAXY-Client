import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:laxy/common/component/custom_floating_action_button.dart';
import 'package:laxy/common/component/custom_text_form_field.dart';
import 'package:laxy/screen/login_screen.dart';
import 'package:laxy/screen/temp_start_screen.dart';
import 'package:laxy/theme/custom_theme_mode.dart';
import 'package:laxy/theme/custom_theme_data.dart';
import 'package:laxy/screen/trends_screen.dart';
import 'package:laxy/screen/login_screen.dart';

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

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
