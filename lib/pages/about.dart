import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:knn_telur/utils/atom/text_style.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: AutoSizeText(
          'TENTANG APLIKASI',
          style: globalTextStyle,
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  'Dibangun menggunakan : ',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  '- VSCode Code Editor v1.55.2',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  '- Flutter SDK 2.2',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  '- Java Development Kit v16.0',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Text(
                  'Implements : ',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  '- Null Safety',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  '- BLoC Pattern',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
