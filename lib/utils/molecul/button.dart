import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

Widget menuButton(v, press, c) => Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: press,
          child: Container(
            width: MediaQuery.of(c).size.width - 20,
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            decoration: BoxDecoration(
                color: Colors.cyan,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.cyan)),
            child: Center(
                child: AutoSizeText(v,
                    style: TextStyle(color: Colors.white, fontSize: 12))),
          ),
        )
      ],
    );
