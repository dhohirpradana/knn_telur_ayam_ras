import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:knn_telur/utils/atom/text_data.dart';
import 'package:knn_telur/utils/atom/text_style.dart';

Widget widgetData(context, r, g, b, h, s, l) => Flexible(
    flex: 1,
    child: Container(
      padding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
      height: MediaQuery.of(context).size.width / 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              AutoSizeText(
                'Data Gambar',
                style: globalTextStyle,
              ),
            ],
          ),
          textR(r),
          textG(g),
          textB(b),
          textH(h),
          textS(s),
          textL(l),
        ],
      ),
    ));
