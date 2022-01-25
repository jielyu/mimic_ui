import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MimicWechat",
      theme: ThemeData(
          primaryColor: const Color(0xFFEDEDED),
          textTheme:
              const TextTheme(headline5: TextStyle(color: Color(0xFF171717)))),
      //routes: Map(),
      home: HomePage(),
    );
  }
}
