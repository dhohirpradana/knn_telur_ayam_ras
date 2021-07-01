import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:knn_telur/helper/list_hitung.dart';
import 'package:knn_telur/utils/atom/text_state.dart';
import 'package:knn_telur/utils/atom/text_style.dart';
import 'package:knn_telur/utils/molecul/listdata.dart';

Widget listResult(i) => Row(children: <Widget>[
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
      Expanded(child: textListResult(i, 'r')),
      Expanded(child: textListResult(i, 'g')),
      Expanded(child: textListResult(i, 'b')),
      Expanded(child: textListResult(i, 'h')),
      Expanded(child: textListResult(i, 's')),
      Expanded(child: textListResult(i, 'l')),
      Expanded(child: textListResult(i, 'jarak')),
      Expanded(child: textStateList(selisihList[i]['state'])),
    ]);
