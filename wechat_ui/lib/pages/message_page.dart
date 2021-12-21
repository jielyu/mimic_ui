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
          Text(
            "message3",
            style: TextStyle(fontSize: 40),
          ),
          Text(
            "message4",
            style: TextStyle(fontSize: 40),
          ),
          Text(
            "message5",
            style: TextStyle(fontSize: 40),
          ),
          Text(
            "message6",
            style: TextStyle(fontSize: 40),
          ),
          Text(
            "message7",
            style: TextStyle(fontSize: 40),
          ),
          Text(
            "message8",
            style: TextStyle(fontSize: 40),
          ),
          Text(
            "message9",
            style: TextStyle(fontSize: 40),
          ),
          Text(
            "message10",
            style: TextStyle(fontSize: 40),
          ),
          Text(
            "message11",
            style: TextStyle(fontSize: 40),
          ),
          Text(
            "message12",
            style: TextStyle(fontSize: 40),
          ),
          Text(
            "message13",
            style: TextStyle(fontSize: 40),
          ),
          Text(
            "message14",
            style: TextStyle(fontSize: 40),
          ),
        ],
      ),
    );
  }
}
