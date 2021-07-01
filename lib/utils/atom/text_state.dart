import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

Widget textStateList(v) => Container(
      margin: EdgeInsets.only(top: 10),
      child: AutoSizeText(
        (v == 1) ? 'B' : 'KB',
        style: TextStyle(fontSize: 14),
      ),
    );
