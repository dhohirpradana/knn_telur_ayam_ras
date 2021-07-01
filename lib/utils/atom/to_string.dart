import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:knn_telur/utils/atom/text_style.dart';

Widget textToString(v) => Text(v.toString());

Widget textToStringSubstr(v, min, max) => AutoSizeText(
      v.toString().substring(min, max),
      style: globalTextStyle,
    );

Widget textToStringFixed(v, min, max) => textToStringSubstr(
    v, min, (v.toString().length > max ? max : (v.toString().length)));
