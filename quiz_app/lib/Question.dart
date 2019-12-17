import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String _qText;

  Question(this._qText);

  @override
  Widget build(BuildContext context) {
    return Text(
      _qText,
      style: TextStyle(
        color: Colors.white70,
        fontSize: 20.0,
      ),
    );
  }
}
