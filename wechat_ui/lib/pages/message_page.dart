import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:wechat_ui/utils/utils.dart';
import 'package:wechat_ui/pages/chat_page.dart';

/// 用于存储消息相关的内容
class MessageInfo {
  String name; // 显示的用户名
  String recentMsg; // 最近一条消息
  DateTime? recentTime; // 最近消息的时间

  MessageInfo(this.name, this.recentMsg) {
    recentTime = DateTime.now();
  }

  // 从json数据创建对象
  MessageInfo.fromJson(Map<String, dynamic> jsonObj)
      : name = jsonObj['username'],
        recentMsg = jsonObj['recent_msg'] {
    recentTime = DateTime.now();
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'recentMsg': recentMsg,
        'recentTime': recentTime.toString()
      };

  @override
  String toString() => json.encode(this);
}

class MessagesPage extends StatefulWidget {
  const MessagesPage({Key? key}) : super(key: key);

  @override
  _MessagesPageState createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  List<MessageInfo> msgList = [];

  @override
  void initState() {
    super.initState();
    // 从json文件中载入数据
    loadJson();
  }

  void loadJson() async {
    rootBundle.loadString('assets/data/msg_models.json').then((value) {
      List list = json.decode(value);
      for (var v in list) {
        msgList.add(MessageInfo.fromJson(v));
      }
      // 打印生成的对象列表
      // print(msgList.length);
      // for (var v in msgList) {
      //   print(v);
      // }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    Log.info("Message Page build", StackTrace.current);
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).primaryColor,
          title: Center(
            child: Text(
              "消息",
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            var item = msgList[index];
            return Column(
              children: [
                ListTile(
                  leading: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            style: BorderStyle.solid, color: Colors.blue),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(3))),
                    child: const Icon(
                      Icons.person,
                      size: 40,
                    ),
                  ),
                  title: Text(
                    item.name,
                    style: const TextStyle(overflow: TextOverflow.ellipsis),
                  ),
                  subtitle: Text(
                    item.recentMsg,
                    style: const TextStyle(overflow: TextOverflow.ellipsis),
                  ),
                  onTap: () {
                    // Log.info(item.name, StackTrace.current);
                    // showSnackBar(context, 'onItemClick : ${item.name}');
                    Navigator.of(context, rootNavigator: true).push(
                        MaterialPageRoute(
                            fullscreenDialog: true,
                            builder: (context) => DialogPage(id: item.name)));
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         fullscreenDialog: true,
                    //         builder: (context) => DialogPage(id: item.name)));
                  },
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    color: const Color.fromARGB(255, 231, 228, 228),
                    height: 1,
                    width: 350,
                    alignment: Alignment.centerRight,
                  ),
                )
              ],
            );
          },
          itemCount: msgList.length,
        ));
  }
}
