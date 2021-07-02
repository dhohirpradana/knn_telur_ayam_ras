import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:knn_telur/utils/atom/text_style.dart';

class WidgetTextToStringFixed extends StatelessWidget {
  final v, min, max;

  const WidgetTextToStringFixed(
      {Key? key, required this.v, required this.min, required this.max})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      v.toString().substring(
          min, (v.toString().length > max ? max : (v.toString().length))),
      style: globalTextStyle,
    );
  }
}
