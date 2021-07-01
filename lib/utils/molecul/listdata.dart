import 'package:flutter/material.dart';
import 'package:knn_telur/helper/list_hitung.dart';
import 'package:knn_telur/utils/atom/to_string.dart';

Widget textListResult(i, param) => Container(
      margin: EdgeInsets.only(top: 10),
      child: textToStringSubstr(
          selisihList[i]['$param'],
          0,
          (selisihList[i]['$param'].toString().length > 4)
              ? 5
              : selisihList[i]['$param'].toString().length),
    );
