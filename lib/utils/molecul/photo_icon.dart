import 'package:flutter/material.dart';

Widget photoIcon(context) => Container(
      height: MediaQuery.of(context).size.width / 2,
      width: MediaQuery.of(context).size.width - 20,
      // height: MediaQuery.of(context).size.width - 90,
      child: Icon(
        Icons.photo,
        color: Colors.cyan,
        size: MediaQuery.of(context).size.width / 4,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.cyan)),
    );
