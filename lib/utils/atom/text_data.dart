import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:knn_telur/utils/atom/text_style.dart';
import 'package:knn_telur/utils/atom/to_string.dart';

class WidgetTextH extends StatelessWidget {
  final v;

  const WidgetTextH({Key? key, required this.v}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const AutoSizeText.rich(
          TextSpan(
            style: globalTextStyle,
            text: 'Hue\t\t\t\t\t\t\t\t\t\t',
          ),
        ),
        const Text(': '),
        WidgetTextToStringFixed(v: v, min: 0, max: 5)
      ],
    );
  }
}

class WidgetTextS extends StatelessWidget {
  final v;

  const WidgetTextS({Key? key, required this.v}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const AutoSizeText.rich(
          TextSpan(
            style: globalTextStyle,
            text: 'Saturation\t\t',
          ),
        ),
        const AutoSizeText(': '),
        WidgetTextToStringFixed(v: v, min: 0, max: 5)
      ],
    );
  }
}

class WidgetTextL extends StatelessWidget {
  final v;

  const WidgetTextL({Key? key, required this.v}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const AutoSizeText.rich(
          TextSpan(
            style: globalTextStyle,
            text: 'Lightness\t\t\t\t',
          ),
        ),
        const AutoSizeText(': '),
        WidgetTextToStringFixed(v: v, min: 0, max: 5)
      ],
    );
  }
}

class WidgetTextR extends StatelessWidget {
  final v;

  const WidgetTextR({Key? key, required this.v}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const AutoSizeText.rich(
          TextSpan(
            style: globalTextStyle,
            text: 'Red\t\t\t\t\t\t\t\t\t',
          ),
        ),
        const AutoSizeText(': '),
        WidgetTextToStringFixed(v: v, min: 0, max: 5)
      ],
    );
  }
}

class WidgetTextG extends StatelessWidget {
  final v;

  const WidgetTextG({Key? key, required this.v}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const AutoSizeText.rich(
          TextSpan(
            style: globalTextStyle,
            text: 'Green\t\t\t\t\t\t\t',
          ),
        ),
        const AutoSizeText(': '),
        WidgetTextToStringFixed(v: v, min: 0, max: 5)
      ],
    );
  }
}

class WidgetTextB extends StatelessWidget {
  final v;

  const WidgetTextB({Key? key, required this.v}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const AutoSizeText.rich(
          TextSpan(
            style: globalTextStyle,
            text: 'Blue\t\t\t\t\t\t\t\t\t',
          ),
        ),
        const AutoSizeText(': '),
        WidgetTextToStringFixed(v: v, min: 0, max: 5)
      ],
    );
  }
}
