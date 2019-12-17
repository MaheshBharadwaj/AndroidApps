import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String _qText;

  Question(this._qText);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      width: double.infinity,
      child: Text(
        _qText,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white70,
          fontSize: 25.0,
        ),
      ),
    );
  }
}
