import 'package:flutter/material.dart';

class ResultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10.0),
      child: Text(
        'Quiz Completed!',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 30.0, color: Colors.white70, fontStyle: FontStyle.italic),
      ),
    );
  }
}
