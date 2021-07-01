import 'package:auto_size_text/auto_size_text.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:knn_telur/pages/setting.dart';
import 'package:knn_telur/pages/tester.dart';
import 'package:knn_telur/pages/training_main.dart';

class FoundationPage extends StatefulWidget {
  @override
  _FoundationPageState createState() => _FoundationPageState();
}

class _FoundationPageState extends State<FoundationPage> {
  int page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: AutoSizeText(
          'KLASIFIKASI KUALITAS TELUR AYAM RAS',
          style: TextStyle(fontSize: 14),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.info_outline,
              color: Colors.white,
              size: 20,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/about');
            },
          )
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 60.0,
        items: <Widget>[
          const Icon(Icons.home, size: 20),
          const Icon(Icons.list, size: 20),
          const Icon(Icons.settings, size: 20),
          // Icon(Icons.info_outline, size: 30),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.cyan[50]!,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 500),
        onTap: (index) {
          setState(() {
            page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      body: Container(
        color: Colors.cyan[50],
        child: (page == 0)
            ? TesterPage()
            : (page == 1)
                ? TrainingMainPage()
                : SettingPage(),
      ),
    );
  }
}
