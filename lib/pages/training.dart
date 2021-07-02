import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class TrainingPage extends StatefulWidget {
  @override
  _TrainingPageState createState() => _TrainingPageState();
}

class _TrainingPageState extends State<TrainingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const AutoSizeText(
          'DATA TRAINING KUALITAS BAIK',
          style: TextStyle(fontSize: 14),
        ),
        actions: <Widget>[
          Center(
              child: Container(
                  padding: EdgeInsets.only(right: 10), child: Text('60')))
        ],
      ),
      body: GridView.builder(
        itemCount: 60,
        itemBuilder: (context, index) {
          final i = index + 1;
          return Container(
            padding: EdgeInsets.all(5),
            child: Column(
              children: [
                Image.asset(
                  'lib/assets/image/1/$i.jpg',
                  cacheHeight: 100,
                  cacheWidth: 150,
                ),
                // AutoSizeText(
                //   'BAIK',
                //   style: TextStyle(fontSize: 12),
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
