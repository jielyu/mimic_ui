import 'package:flutter/material.dart';

import 'package:wechat_ui/utils/utils.dart';

class DiscoveryPage extends StatelessWidget {
  const DiscoveryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Log.info("Discovery Page build", StackTrace.current);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFEDEDED),
        title: const Center(
          child: Text(
            "发现页",
            style: TextStyle(color: Color(0xFF171717)),
          ),
        ),
      ),
      body: const Text(""),
    );
  }
}
