import 'package:flutter/material.dart';

class MinePage extends StatelessWidget {
  const MinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFEDEDED),
        title: const Center(
          child: Text(
            "我",
            style: TextStyle(color: Color(0xFF171717)),
          ),
        ),
      ),
      body: const Text("Mine"),
    );
  }
}
