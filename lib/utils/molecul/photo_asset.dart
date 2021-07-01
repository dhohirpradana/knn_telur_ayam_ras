import 'dart:convert';

import 'package:flutter/material.dart';

Widget photoAsset(context, f) => Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // border: Border.all(color: Colors.cyan)),
      ),
      height: MediaQuery.of(context).size.width / 2,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Image.memory(
          base64Decode(f!),
        ),
      ),
    );
