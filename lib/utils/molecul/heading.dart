import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

Widget headingListView() => Container(
      margin: EdgeInsets.only(bottom: 5),
      child: Row(children: [
        const SizedBox(
            width: 20,
            child: const AutoSizeText('K',
                style: TextStyle(
                  height: 1.0,
                  fontSize: 15.2,
                  fontWeight: FontWeight.bold,
                ))),
        const Expanded(
            child: const AutoSizeText('R',
                style: TextStyle(
                  height: 1.0,
                  fontSize: 15.2,
                  fontWeight: FontWeight.bold,
                ))),
        const Expanded(
            child: const AutoSizeText('G',
                style: TextStyle(
                  height: 1.0,
                  fontSize: 15.2,
                  fontWeight: FontWeight.bold,
                ))),
        const Expanded(
            child: const AutoSizeText('B',
                style: TextStyle(
                  height: 1.0,
                  fontSize: 15.2,
                  fontWeight: FontWeight.bold,
                ))),
        const Expanded(
            child: const AutoSizeText('H',
                style: TextStyle(
                  height: 1.0,
                  fontSize: 15.2,
                  fontWeight: FontWeight.bold,
                ))),
        const Expanded(
            child: const AutoSizeText('S',
                style: TextStyle(
                  height: 1.0,
                  fontSize: 15.2,
                  fontWeight: FontWeight.bold,
                ))),
        const Expanded(
            child: const AutoSizeText('L',
                style: TextStyle(
                  height: 1.0,
                  fontSize: 15.2,
                  fontWeight: FontWeight.bold,
                ))),
        const Expanded(
            child: const AutoSizeText('Jarak',
                style: TextStyle(
                  height: 1.0,
                  fontSize: 15.2,
                  fontWeight: FontWeight.bold,
                ))),
        const Expanded(
            child: const AutoSizeText('Nilai',
                style: TextStyle(
                  height: 1.0,
                  fontSize: 15.2,
                  fontWeight: FontWeight.bold,
                ))),
      ]),
    );
