import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class Training3Page extends StatefulWidget {
  @override
  _Training3PageState createState() => _Training3PageState();
}

class _Training3PageState extends State<Training3Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const AutoSizeText(
          'DATA TRAINING KUALITAS TIDAK BAIK',
          style: TextStyle(fontSize: 12),
        ),
        actions: <Widget>[
          Center(
              child: Container(
                  padding: EdgeInsets.only(right: 10), child: Text('4')))
        ],
      ),
      body: GridView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          final i = index + 1;
          return Container(
            padding: EdgeInsets.all(5),
            child: Column(
              children: [
                Image.asset(
                  'lib/assets/image/-1/$i.jpg',
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
        cacheExtent: 1,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 1,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5),
      ),
    );
  }
}
