import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:knn_telur/utils/atom/text_data.dart';
import 'package:knn_telur/utils/atom/text_style.dart';

class WidgetData extends StatelessWidget {
  final r, g, b, h, s, l;

  const WidgetData(
      {Key? key,
      required this.r,
      required this.g,
      required this.b,
      required this.h,
      required this.s,
      required this.l})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flexible(
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
              WidgetTextR(v: r),
              WidgetTextG(v: g),
              WidgetTextB(v: b),
              WidgetTextH(v: h),
              WidgetTextS(v: s),
              WidgetTextL(v: l),
            ],
          ),
        ));
  }
}
