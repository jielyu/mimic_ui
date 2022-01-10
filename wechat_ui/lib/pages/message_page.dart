import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("消息"),
        ),
      ),
      body: ListView(
        children: const [
          Text(
            "message1",
            style: TextStyle(fontSize: 40),
          ),
          Text(
            "message2",
            style: TextStyle(fontSize: 40),
          ),
        ],
      ),
    );
  }
}
