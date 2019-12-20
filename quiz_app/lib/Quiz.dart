import 'package:flutter/material.dart';

import './Question.dart';
import './AnswerButton.dart';

class QuizWidget extends StatelessWidget {
  final List<Map<String, Object>> _questions;
  final int _index;
  final Function _fAction;

  QuizWidget(this._questions, this._index, this._fAction);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(_questions[_index]['question']),
        ...(_questions[_index]['choices'] as List< Map <String,Object>>).map((choice) {
          return AnswerButton(choice['text'], () =>_fAction(choice['score']));
        }).toList(),
        RaisedButton(
          child: Icon(
            Icons.save,
            size: 30.0,
          ),
          onPressed: () {},
          color: Colors.grey,
        ),
      ],
    );
  }
}
