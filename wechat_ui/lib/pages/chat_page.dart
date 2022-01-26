import 'package:flutter/material.dart';

/// 用于提供对话页面的实现
///
///
///

class ChatItemWidget extends StatelessWidget {
  final String? userIcon;
  final String msgContent;
  final int index;
  const ChatItemWidget(
      {Key? key, this.userIcon, required this.msgContent, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool showTimeStamp = false;
    var item = <Widget>[];
    if (showTimeStamp == true) {
      final timeWidget = Container(
        child: Text(msgContent),
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: const Color(0xffdadada),
        ),
      );
      item.add(timeWidget);
    }
    bool showOnLeft = index % 2 == 0;
    final itemWidget = Row(
      textDirection: showOnLeft ? TextDirection.ltr : TextDirection.rtl,
      children: <Widget>[
        Container(
            margin: const EdgeInsets.all(5),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(3),
                child:
                    // Image(image: null, height: 30, width: 30, fit: BoxFit.fill),
                    const Icon(Icons.person))),
        Container(
          padding: const EdgeInsets.all(10),
          constraints: const BoxConstraints(maxWidth: 240),
          decoration: BoxDecoration(
              color: showOnLeft
                  ? const Color(0xffffffff)
                  : const Color(0xff98e165),
              borderRadius: BorderRadius.circular(3.0)),
          child: Text(msgContent),
        )
      ],
    );
    item.add(itemWidget);
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 3, 10, 3),
      child: Column(
        children: item,
      ),
    );
  }
}

/// 用于定制聊天记录的显示页面
class TalkList extends StatefulWidget {
  const TalkList({Key? key}) : super(key: key);

  @override
  _TalkListState createState() => _TalkListState();
}

class _TalkListState extends State<TalkList> {
  final ScrollController scrollController =
      ScrollController(initialScrollOffset: 0);
  final numItems = 50;
  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      // ignore: avoid_print
      // print("listen scroll");
    });
  }

  int get acculateReqLength {
    return 1;
  }

  void getMoreChatRecorder() {}

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance!.addPostFrameCallback((_) {
    //   scrollController.jumpTo(scrollController.position.maxScrollExtent);
    // });
    return Expanded(
      child: Container(
          color: const Color(0xfff5f5f5),
          margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: ListView.builder(
            reverse: true,
            itemBuilder: (BuildContext context, int index) {
              index = numItems - (index + 1);
              var item = <Widget>[];
              if (index == 0) {
                bool isLoading = true;
                final indicator = false
                    // ignore: dead_code
                    ? const Center(child: Text('一一没有更多消息了一一'))
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Opacity(
                            // ignore: dead_code
                            opacity: isLoading ? 1.0 : 0.0,
                            child: const CircularProgressIndicator(),
                          ),
                        ),
                      );
                item.add(indicator);
              }
              final chatItem = ChatItemWidget(
                  msgContent:
                      "测试消息测试消息测试消息测试消息测试消息测试消息测试消息.hello_" + index.toString(),
                  index: index);
              item.add(chatItem);
              // ignore: avoid_unnecessary_containers
              return Column(
                children: item,
              );
            },
            itemCount: numItems,
            controller: scrollController,
          )),
    );
  }
}

/// 用于定制文本输入框
class ChatInputForm extends StatefulWidget {
  final ScrollController scrollController;
  const ChatInputForm({Key? key, required this.scrollController})
      : super(key: key);

  @override
  _ChatInputFormState createState() => _ChatInputFormState();
}

class _ChatInputFormState extends State<ChatInputForm> {
  final GlobalKey _formKey = GlobalKey<FormState>();
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        color: const Color(0xfff5f5f5),
        margin: const EdgeInsets.fromLTRB(10, 3, 10, 3),
        child: TextFormField(
          autofocus: false,
          maxLength: 3,
          minLines: 1,
          controller: _textEditingController,
          decoration: InputDecoration(
              hintText: "请输入内容",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              prefixIcon: const Icon(Icons.settings_voice),
              suffixIcon: IconButton(
                icon: const Icon(Icons.message),
                onPressed: () {
                  // 保证在组件build的第一帧时才去触发取消清空内容
                  WidgetsBinding.instance?.addPostFrameCallback((_) {
                    _textEditingController.clear();
                  });
                  //  键盘自动收起
                  //FocusScope.of(context).requestFocus(FocusNode());
                  widget.scrollController.jumpTo(
                      widget.scrollController.position.maxScrollExtent + 10);
                  // ignore: avoid_print
                  print("点击发送按钮");
                },
              )),
        ),
      ),
    );
  }
}

/// 用于定制聊天对话页面
class DialogPage extends StatefulWidget {
  final String? id;
  const DialogPage({Key? key, this.id}) : super(key: key);

  @override
  _DialogPageState createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  final ScrollController _scrollController =
      ScrollController(initialScrollOffset: 18000);

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print("start chat page");
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.id ?? "Unknown",
          style: Theme.of(context).textTheme.headline5,
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        children: [
          const TalkList(),
          ChatInputForm(scrollController: _scrollController)
        ],
      ),
    );
  }
}
