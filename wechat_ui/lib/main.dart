import 'dart:io';
import 'package:flutter/material.dart';
import 'pages/home_page.dart';

import 'package:bitsdojo_window/bitsdojo_window.dart';

void main() {
  runApp(const MyApp());
  // 针对桌面平台的设置
  if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
    doWhenWindowReady(() {
      final win = appWindow;
      const width = 400.0;
      const ratio = 16 / 9;
      const height = width * ratio;
      const initialSize = Size(width, height);
      appWindow.minSize = initialSize;
      appWindow.size = initialSize;
      appWindow.alignment = Alignment.center;
      win.title = "WeChat";
      win.show();
    });
  }
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
      home: const HomePage(),
    );
  }
}
