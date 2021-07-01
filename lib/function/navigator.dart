import 'package:flutter/material.dart';

pageNavigator(context, page) => () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => page));
    };
