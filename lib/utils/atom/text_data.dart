import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:knn_telur/utils/atom/text_style.dart';
import 'package:knn_telur/utils/atom/to_string.dart';

Widget textH(h) => Row(
      children: [
        AutoSizeText.rich(
          TextSpan(
            style: globalTextStyle,
            text: 'Hue\t\t\t\t\t\t\t\t\t\t',
          ),
        ),
        Text(': '),
        textToStringFixed(h, 0, 5)
      ],
    );

Widget textS(s) => Row(
      children: [
        AutoSizeText.rich(
          TextSpan(
            style: globalTextStyle,
            text: 'Saturation\t\t',
          ),
        ),
        AutoSizeText(': '),
        textToStringFixed(s, 0, 5)
      ],
    );
Widget textL(v) => Row(
      children: [
        AutoSizeText.rich(
          TextSpan(
            style: globalTextStyle,
            text: 'Lightness\t\t\t\t',
          ),
        ),
        AutoSizeText(': '),
        textToStringFixed(v, 0, 5)
      ],
    );

Widget textR(v) => Row(
      children: [
        AutoSizeText.rich(
          TextSpan(
            style: globalTextStyle,
            text: 'Red\t\t\t\t\t\t\t\t\t',
          ),
        ),
        AutoSizeText(': '),
        textToStringFixed(v, 0, 7)
      ],
    );

Widget textG(v) => Row(
      children: [
        AutoSizeText.rich(
          TextSpan(
            style: globalTextStyle,
            text: 'Green\t\t\t\t\t\t\t',
          ),
        ),
        AutoSizeText(': '),
        textToStringFixed(v, 0, 7)
      ],
    );

Widget textB(v) => Row(
      children: [
        AutoSizeText.rich(
          TextSpan(
            style: globalTextStyle,
            text: 'Blue\t\t\t\t\t\t\t\t\t',
          ),
        ),
        AutoSizeText(': '),
        textToStringFixed(v, 0, 7)
      ],
    );
