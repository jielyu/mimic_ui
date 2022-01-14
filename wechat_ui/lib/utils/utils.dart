import 'package:flutter/material.dart';

String getImgPath(String name, {String format = 'png'}) {
  return 'assets/images/$name.$format';
}

void showSnackBar(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(msg),
      duration: const Duration(seconds: 1),
    ),
  );
}

Widget getSusItem(BuildContext context, String tag, {double susHeight = 40}) {
  if (tag == '★') {
    tag = '★ 热门城市';
  }
  return Container(
    height: susHeight,
    width: MediaQuery.of(context).size.width,
    padding: const EdgeInsets.only(left: 16.0),
    color: const Color(0xFFF3F4F5),
    alignment: Alignment.centerLeft,
    child: Text(
      tag,
      softWrap: false,
      style: const TextStyle(
        fontSize: 14.0,
        color: Color(0xFF666666),
      ),
    ),
  );
}

/// 封装日志打印的接口
class Log {
  static info(String message, [StackTrace? stackTrace]) {
    log('INFO', message, stackTrace);
  }

  static error(String message, [StackTrace? stackTrace]) {
    log('ERROR', message, stackTrace);
  }

  static warning(String message, [StackTrace? stackTrace]) {
    log('WARNING', message, stackTrace);
  }

  /// 控制日志打印的格式
  static log(String type, String message, [StackTrace? stackTrace]) {
    assert(() {
      if (stackTrace != null) {
        CustomTrace customTrace = CustomTrace(stackTrace);
        // ignore: avoid_print
        print(
            '[$type] ${DateTime.now()} ${customTrace.fileName}:(${customTrace.lineNumber}) - $message');
      } else {
        // ignore: avoid_print
        print('[$type] $message');
      }
      return true;
    }());
  }
}

class CustomTrace {
  final StackTrace _trace;

  late String fileName;
  late int lineNumber;
  late int columnNumber;

  CustomTrace(this._trace) {
    _parseTrace();
  }

  void _parseTrace() {
    var traceString = _trace.toString().split("\n")[0];
    var indexOfFileName = traceString.indexOf(RegExp(r'[A-Za-z_/]+.dart'));
    var fileInfo = traceString.substring(indexOfFileName);
    var listOfInfos = fileInfo.split(":");
    fileName = listOfInfos[0];
    lineNumber = int.parse(listOfInfos[1]);
    var columnStr = listOfInfos[2];
    columnStr = columnStr.replaceFirst(")", "");
    columnNumber = int.parse(columnStr);
  }
}
