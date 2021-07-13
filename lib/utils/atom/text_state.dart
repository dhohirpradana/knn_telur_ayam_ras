import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class TextStateListWidget extends StatelessWidget {
  final int v;

  const TextStateListWidget({Key? key, required this.v}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: AutoSizeText(
        (v == 1)
            ? 'B'
            : (v == 1)
                ? 'TB'
                : 'KB',
        style: TextStyle(fontSize: 14),
      ),
    );
  }
}
