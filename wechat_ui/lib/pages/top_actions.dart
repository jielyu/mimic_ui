import 'package:flutter/material.dart';

class TopActionWidget extends StatelessWidget {
  const TopActionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

List<Widget> getTopActions() {
  return [
    IconButton(
      icon: const Icon(
        Icons.search,
        color: Colors.black,
      ),
      onPressed: () {
        // ignore: avoid_print
        print("search");
      },
    ),
    IconButton(
      icon: const Icon(Icons.add_circle_outline, color: Colors.black),
      onPressed: () {
        // ignore: avoid_print
        print("add");
      },
    )
  ];
}
