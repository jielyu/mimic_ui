import 'package:flutter/material.dart';

import 'package:wechat_ui/utils/utils.dart';

class DiscoveryPage extends StatelessWidget {
  const DiscoveryPage({Key? key}) : super(key: key);

  Color getItemBgColor() {
    return const Color.fromARGB(255, 233, 230, 230);
  }

  Widget buildTextButton(
      BuildContext context, String name, IconData icon, Color iconColor) {
    return TextButton(
      style: TextButton.styleFrom(padding: const EdgeInsets.all(0)),
      onPressed: () {
        Log.info(name, StackTrace.current);
        showSnackBar(context, 'onItemClick : $name');
      },
      child: ListTile(
        leading: Icon(
          icon,
          color: iconColor,
        ),
        title: Text(name),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }

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
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(0),
            color: getItemBgColor(),
            child: buildTextButton(context, "朋友圈", Icons.camera, Colors.blue),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            color: getItemBgColor(),
            child: buildTextButton(
                context, "视频号", Icons.video_call_sharp, Colors.orange),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 1, 0, 0),
            color: getItemBgColor(),
            child: buildTextButton(
                context, "直播", Icons.motion_photos_on, Colors.red),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            color: getItemBgColor(),
            child:
                buildTextButton(context, "附近", Icons.people_alt, Colors.blue),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            color: getItemBgColor(),
            child: buildTextButton(context, "小程序", Icons.pix, Colors.purple),
          ),
        ],
      ),
    );
  }
}
