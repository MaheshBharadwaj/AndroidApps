import 'package:flutter/material.dart';

class ResultWidget extends StatelessWidget {
  final int _totalScore;

  ResultWidget(this._totalScore);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 150.0,bottom: 150.0),
      child: Column(
        children: <Widget>[
          Text(
            'Quiz Completed!',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 30.0,
                color: Colors.white70,
                fontStyle: FontStyle.italic),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10.0),
          ),
          Text(
            _totalScore.toString(),
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.blueAccent,
            ),
          )
        ],
      ),
    );
  }
}
