import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:wechat_ui/utils/utils.dart';

import 'package:azlistview/azlistview.dart';
import 'package:lpinyin/lpinyin.dart';
import 'package:common_utils/common_utils.dart';
import 'package:wechat_ui/pages/top_actions.dart';

/// 封装联系人信息
class ContactInfo extends ISuspensionBean {
  String name;
  String? tagIndex;
  String? namePinyin;

  Color? bgColor;
  IconData? iconData;

  String? img;
  String? id;
  String? firstletter;

  ContactInfo({
    required this.name,
    this.tagIndex,
    this.namePinyin,
    this.bgColor,
    this.iconData,
    this.img,
    this.id,
    this.firstletter,
  });

  /// 从json生成对象
  ContactInfo.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        img = json['img'],
        id = json['id']?.toString(),
        firstletter = json['firstletter'];

  /// 对象转换为json
  Map<String, dynamic> toJson() => {
        'name': name,
        'img': img,
      };

  /// 获取悬浮标签
  @override
  String getSuspensionTag() => tagIndex!;

  @override
  String toString() => json.encode(this);
}

/// 获取微信风格列表项目
Widget getWeChatListItem(
  BuildContext context,
  ContactInfo model, {
  double susHeight = 40,
  Color? defHeaderBgColor,
}) {
  DecorationImage? image;
  return ListTile(
    leading: Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(4.0),
        color: model.bgColor ?? defHeaderBgColor,
        image: image,
      ),
      child: model.iconData == null
          ? null
          : Icon(
              model.iconData,
              color: Colors.white,
              size: 20,
            ),
    ),
    title: Text(model.name),
    onTap: () {
      LogUtil.e("onItemClick : $model");
      showSnackBar(context, 'onItemClick : ${model.name}');
    },
  );
}

class ContactsPage extends StatefulWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  List<ContactInfo> contactList = [];
  List<ContactInfo> topList = [];

  /// 第一次创建时加载数据
  @override
  void initState() {
    super.initState();
    topList.add(ContactInfo(
        name: '新的朋友',
        tagIndex: '↑',
        bgColor: Colors.orange,
        iconData: Icons.person_add));
    topList.add(ContactInfo(
        name: '群聊',
        tagIndex: '↑',
        bgColor: Colors.green,
        iconData: Icons.people));
    topList.add(ContactInfo(
        name: '标签',
        tagIndex: '↑',
        bgColor: Colors.blue,
        iconData: Icons.local_offer));
    topList.add(ContactInfo(
        name: '公众号',
        tagIndex: '↑',
        bgColor: Colors.blueAccent,
        iconData: Icons.person));
    loadData();
  }

  /// 联系人列表数据
  void loadData() async {
    //从json文件中载入联系人数据
    rootBundle.loadString('assets/data/car_models.json').then((value) {
      List list = json.decode(value);
      for (var v in list) {
        contactList.add(ContactInfo.fromJson(v));
      }
      _handleList(contactList);
    });
  }

  /// 按规则处理联系人列表，包括拼音首字母排序
  void _handleList(List<ContactInfo> list) {
    if (list.isEmpty) return;
    // 获取名称拼音的首字母
    for (int i = 0, length = list.length; i < length; i++) {
      String pinyin = PinyinHelper.getPinyinE(list[i].name);
      String tag = pinyin.substring(0, 1).toUpperCase();
      list[i].namePinyin = pinyin;
      if (RegExp("[A-Z]").hasMatch(tag)) {
        list[i].tagIndex = tag;
      } else {
        list[i].tagIndex = "#";
      }
    }
    // 从A到Z排序
    SuspensionUtil.sortListBySuspensionTag(contactList);
    // 显示悬浮标签
    SuspensionUtil.setShowSuspensionStatus(contactList);
    // 插入头部元素
    contactList.insertAll(0, topList);
    // 触发UI重绘
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Log.info("Contacts Page build", StackTrace.current);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).primaryColor,
        title: Center(
          child: Text(
            '通讯录',
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        leading: const Text(""),
        actions: getTopActions(),
      ),
      body: AzListView(
        data: contactList,
        itemCount: contactList.length,
        itemBuilder: (BuildContext context, int index) {
          ContactInfo model = contactList[index];
          return Column(
            children: [
              getWeChatListItem(
                context,
                model,
                defHeaderBgColor: const Color(0xFFE5E5E5),
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
        physics: const BouncingScrollPhysics(),
        susItemBuilder: (BuildContext context, int index) {
          ContactInfo model = contactList[index];
          if ('↑' == model.getSuspensionTag()) {
            return Container();
          }
          return getSusItem(context, model.getSuspensionTag());
        },
        indexBarData: const ['↑', ...kIndexBarData],
        indexBarOptions: IndexBarOptions(
          needRebuild: true,
          ignoreDragCancel: true,
          downTextStyle: const TextStyle(fontSize: 12, color: Colors.white),
          downItemDecoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.green),
          indexHintWidth: 120 / 2,
          indexHintHeight: 100 / 2,
          indexHintDecoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(getImgPath('ic_index_bar_bubble_gray')),
              fit: BoxFit.contain,
            ),
          ),
          indexHintAlignment: Alignment.centerRight,
          indexHintChildAlignment: const Alignment(-0.25, 0.0),
          indexHintOffset: const Offset(-20, 0),
        ),
      ),
    );
  }
}
