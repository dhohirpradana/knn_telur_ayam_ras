import 'package:flutter/material.dart';
import 'package:knn_telur/helper/list_hitung.dart';
import 'package:knn_telur/utils/atom/to_string.dart';

class TextListResultWidget extends StatelessWidget {
  final int i;
  final String param;

  const TextListResultWidget({Key? key, required this.i, required this.param})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child:
          WidgetTextToStringFixed(v: selisihList[i]['$param'], min: 0, max: 5),
    );
  }
}
