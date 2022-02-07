import 'dart:io';
import 'package:flutter/material.dart';
import 'pages/home_page.dart';

// 定制标题栏
import 'package:bitsdojo_window/bitsdojo_window.dart';
// 移动端桌面图标右上角标
import 'package:flutter_app_badger/flutter_app_badger.dart';

void main() async {
  runApp(const MyApp());

  // 针对移动平台
  if (Platform.isIOS || Platform.isAndroid) {
    // 增加桌面图标右上角消息数量提醒
    bool res = await FlutterAppBadger.isAppBadgeSupported();
    if (res) {
      FlutterAppBadger.updateBadgeCount(9);
    }
  }

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
      // home: const Text("123"),
    );
  }
}
