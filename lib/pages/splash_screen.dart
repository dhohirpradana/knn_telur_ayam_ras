import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:knn_telur/pages/foundation_page.dart';
import 'package:progress_indicators/progress_indicators.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => FoundationPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[50],
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const AutoSizeText(
                        'KLASIFIKASI TELUR',
                        style: TextStyle(fontSize: 24),
                      ),
                      const AutoSizeText(
                        'AYAM RAS',
                        style: TextStyle(fontSize: 44),
                      ),
                    ],
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width / 4,
                      child: Image.asset('lib/assets/image/splash1.png')),
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 15),
                child: JumpingDotsProgressIndicator(
                  fontSize: 20.0,
                  color: Colors.cyan,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
