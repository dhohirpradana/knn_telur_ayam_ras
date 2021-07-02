import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:knn_telur/helper/list_hitung.dart';
import 'package:knn_telur/utils/atom/text_state.dart';
import 'package:knn_telur/utils/atom/text_style.dart';
import 'package:knn_telur/utils/molecul/listdata.dart';

class ListResultWidget extends StatelessWidget {
  final int i;

  const ListResultWidget({Key? key, required this.i}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      SizedBox(
          width: 20,
          child: Container(
              color: (selisihList[i]['state'] == 0)
                  ? Colors.amber[200]
                  : Colors.transparent,
              padding: EdgeInsets.only(top: 10),
              child: AutoSizeText(
                '' + (i + 1).toString(),
                style: globalTextStyle,
              ))),
      Expanded(child: TextListResultWidget(i: i, param: 'r')),
      Expanded(child: TextListResultWidget(i: i, param: 'g')),
      Expanded(child: TextListResultWidget(i: i, param: 'b')),
      Expanded(child: TextListResultWidget(i: i, param: 'h')),
      Expanded(child: TextListResultWidget(i: i, param: 's')),
      Expanded(child: TextListResultWidget(i: i, param: 'l')),
      Expanded(child: TextListResultWidget(i: i, param: 'jarak')),
      Expanded(
          child: TextStateListWidget(
        v: selisihList[i]['state'],
      )),
    ]);
  }
}
