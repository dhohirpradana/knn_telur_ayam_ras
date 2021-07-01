import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class TrainingMainPage extends StatefulWidget {
  @override
  _TrainingMainPageState createState() => _TrainingMainPageState();
}

class _TrainingMainPageState extends State<TrainingMainPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/trainingbaik');
                  },
                  child: Icon(
                    Icons.folder_special,
                    color: Colors.cyan[700],
                    size: MediaQuery.of(context).size.width / 3,
                  )),
              AutoSizeText(
                'KUALITAS BAIK',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          Column(
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/trainingkurang');
                  },
                  child: Icon(
                    Icons.folder,
                    color: Colors.cyan[700],
                    size: MediaQuery.of(context).size.width / 3,
                  )),
              AutoSizeText('KUALITAS KURANG BAIK',
                  style: TextStyle(fontSize: 14)),
            ],
          ),
        ],
      ),
    );
  }
}
