import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String _bText;
  final Function _fAction;
  AnswerButton(this._bText, this._fAction);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 2.5, bottom: 2.5),
      child: RaisedButton(
        child: Text(
          _bText,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
        onPressed: _fAction,
        color: Colors.blueAccent,
      ),
    );
  }
}
