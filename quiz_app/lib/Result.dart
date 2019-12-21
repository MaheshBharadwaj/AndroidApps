import 'package:flutter/material.dart';

class ResultWidget extends StatelessWidget {
  final int _totalScore;
  final Function _fAction;

  ResultWidget(this._totalScore,this._fAction);

  String get displayText {
    String returnString;
    if (_totalScore > 40)
      returnString = 'Awesome!';
    else if (_totalScore > 30)
      returnString = 'Good Job!';
    else if (_totalScore > 20)
      returnString = 'Not Bad!';
    else
      returnString = 'Can Improve!';

    return returnString;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 200.0, bottom: 150.0),
      child: Column(
        children: <Widget>[
          Text(
            displayText,
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
          ),
          RaisedButton(
            child: Icon(
              Icons.refresh,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: _fAction,
            color: Colors.blueAccent,
          ),
        ],
      ),
    );
  }
}
