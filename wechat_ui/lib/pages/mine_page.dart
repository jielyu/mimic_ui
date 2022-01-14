import 'package:flutter/material.dart';
import 'package:wechat_ui/utils/utils.dart';

class MinePage extends StatelessWidget {
  const MinePage({Key? key}) : super(key: key);

  Widget buildPortraitItem() {
    return const SizedBox(
      height: 60,
      child: ListTile(
        leading: Icon(
          Icons.person,
          size: 60,
        ),
        title: Text("放浪不羁"),
        subtitle: Text("微信号: fanglangbuji"),
      ),
    );
  }

  Widget buildStatesItem() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 30,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextButton(
                style: TextButton.styleFrom(padding: const EdgeInsets.all(0)),
                onPressed: () {
                  Log.info("click state button", StackTrace.current);
                },
                child: const Text(
                  "+状态",
                  style: TextStyle(fontSize: 15, color: Colors.black),
                )),
          ),
          Container(
            height: 30,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextButton(
              style: TextButton.styleFrom(padding: const EdgeInsets.all(2)),
              onPressed: () {
                Log.info("click friends button", StackTrace.current);
              },
              child: Row(
                children: const [
                  Icon(Icons.person),
                  // ignore: unnecessary_const
                  const Text(
                    "1个朋友",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextButton(String name, IconData icon) {
    return TextButton(
      style: TextButton.styleFrom(padding: const EdgeInsets.all(0)),
      onPressed: () {
        Log.info(name, StackTrace.current);
      },
      child: ListTile(
        leading: Icon(icon),
        title: Text(name),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Log.info("Mine Page build", StackTrace.current);
    return Column(
      children: [
        const SizedBox(
          height: 60,
        ),
        Container(
          color: const Color.fromARGB(255, 233, 230, 230),
          child: Column(
            children: [buildPortraitItem(), buildStatesItem()],
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          color: const Color.fromARGB(255, 233, 230, 230),
          child: buildTextButton("支付", Icons.wallet_membership),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
          color: const Color.fromARGB(255, 233, 230, 230),
          child: Column(
            children: [
              buildTextButton("收藏", Icons.favorite),
              buildTextButton("朋友圈", Icons.people),
              buildTextButton("卡包", Icons.card_giftcard),
              buildTextButton("表情", Icons.emoji_emotions),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
          color: const Color.fromARGB(255, 233, 230, 230),
          child: buildTextButton("设置", Icons.settings),
        )
      ],
    );
  }
}
