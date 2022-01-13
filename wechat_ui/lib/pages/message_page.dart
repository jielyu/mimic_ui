import 'package:flutter/material.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({Key? key}) : super(key: key);

  @override
  _MessagesPageState createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFEDEDED),
        title: const Center(
          child: Text(
            "消息",
            style: TextStyle(color: Color(0xFF171717)),
          ),
        ),
      ),
      body: ListView(
        children: const [
          Text(
            "消息1",
            style: TextStyle(fontSize: 20),
          ),
          Text(
            "消息2",
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
