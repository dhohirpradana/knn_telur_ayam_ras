import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class TextStateWidget extends StatelessWidget {
  final int sum, k;

  const TextStateWidget({Key? key, required this.sum, required this.k})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.only(top: 15),
        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: AutoSizeText(
          (sum <= k / 2) ? 'KURANG BAIK' : 'BAIK',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ));
  }
}
