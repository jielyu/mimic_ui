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
        backgroundColor: Theme.of(context).primaryColor,
        title: Center(
          child: Text(
            "发现页",
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
      ),
      body: const Text(""),
    );
  }
}
