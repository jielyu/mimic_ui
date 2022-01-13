import 'package:flutter/material.dart';

String getImgPath(String name, {String format = 'png'}) {
  return 'assets/images/$name.$format';
}

void showSnackBar(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(msg),
      duration: const Duration(seconds: 2),
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
