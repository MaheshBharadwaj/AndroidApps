import 'package:flutter/material.dart';

import 'Question.dart';
import 'AnswerButton.dart';

class MyApp extends StatefulWidget {
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var _questions = ['What\'s your fav color?', 'What\'s your fav animal?'];
  var _index = 0;

  void _buttonClicked() {
    setState(() {
      _index = (_index + 1) % 2;
    });
    print('Button Clicked!');
  }

  @override
  Widget build(BuildContext ctx) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "My First APP",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 25.0,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
        ),
        backgroundColor: Colors.black,
        body: Container(
          margin: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Question(_questions[_index]),
              AnswerButton('Answer 1', _buttonClicked),
              AnswerButton('Answer 2', _buttonClicked),
              AnswerButton('Answer 3', _buttonClicked),
            ],
          ),
        ),
      ),
    );
  }
}
