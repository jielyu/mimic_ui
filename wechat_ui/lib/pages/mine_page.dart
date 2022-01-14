import 'package:flutter/material.dart';
import 'package:wechat_ui/utils/utils.dart';

class MinePage extends StatelessWidget {
  const MinePage({Key? key}) : super(key: key);

  Widget buildPortraitItem(BuildContext context) {
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

  Widget buildStatesItem(BuildContext context) {
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
                  showSnackBar(context, 'onItemClick : 我的状态');
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
                showSnackBar(context, 'onItemClick : 朋友状态');
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
      ),
    );
  }

  Color getItemBgColor() {
    return const Color.fromARGB(255, 233, 230, 230);
  }

  EdgeInsets getItemMargin() {
    return const EdgeInsets.fromLTRB(0, 0, 0, 10);
  }

  @override
  Widget build(BuildContext context) {
    Log.info("Mine Page build", StackTrace.current);
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          Container(
            color: getItemBgColor(),
            child: Column(
              children: [buildPortraitItem(context), buildStatesItem(context)],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            color: getItemBgColor(),
            child: buildTextButton(
                context, "支付", Icons.wallet_membership, Colors.green),
          ),
          Container(
            margin: getItemMargin(),
            color: getItemBgColor(),
            child: Column(
              children: [
                buildTextButton(context, "收藏", Icons.favorite, Colors.orange),
                buildTextButton(context, "朋友圈", Icons.people, Colors.blue),
                buildTextButton(
                    context, "卡包", Icons.card_giftcard, Colors.blue),
                buildTextButton(
                    context, "表情", Icons.emoji_emotions, Colors.orange),
              ],
            ),
          ),
          Container(
            margin: getItemMargin(),
            color: getItemBgColor(),
            child: buildTextButton(context, "设置", Icons.settings, Colors.blue),
          )
        ],
      ),
    );
  }
}
