import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class Training2Page extends StatefulWidget {
  @override
  _Training2PageState createState() => _Training2PageState();
}

class _Training2PageState extends State<Training2Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: AutoSizeText(
          'DATA TRAINING KUALITAS KURANG BAIK',
          style: TextStyle(fontSize: 12),
        ),
        actions: <Widget>[
          Center(
              child: Container(
                  padding: EdgeInsets.only(right: 10), child: Text('45')))
        ],
      ),
      body: GridView.builder(
        itemCount: 45,
        itemBuilder: (context, index) {
          final i = index + 61;
          return Container(
            padding: EdgeInsets.all(5),
            child: Column(
              children: [
                Image.asset(
                  'lib/assets/image/0/$i.jpg',
                  cacheHeight: 100,
                  cacheWidth: 150,
                ),
                // AutoSizeText(
                //   'KURANG BAIK',
                //   style: globalTextStyle,
                // )
              ],
            ),
          );
        },
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 1,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5),
      ),
    );
  }
}
