import 'package:flutter/material.dart';

/// 用于提供对话页面的实现
///

class DialogPage extends StatefulWidget {
  final String? id;
  const DialogPage({Key? key, this.id}) : super(key: key);

  @override
  _DialogPageState createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.id ?? "Unknown",
          style: Theme.of(context).textTheme.headline5,
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: const Text("对话内容"),
    );
  }
}
