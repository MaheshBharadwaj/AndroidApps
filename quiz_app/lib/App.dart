import 'package:flutter/material.dart';
import 'package:quiz_app/Quiz.dart';

import 'Quiz.dart';
import 'Result.dart';

class MyApp extends StatefulWidget {
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var _questions = [
    {
      'question': 'What\'s your favourite color?',
      'choices': <Map<String, Object>>[
        {'text': 'Red', 'score': 10},
        {'text': 'Orange', 'score': 7},
        {'text': 'Yellow', 'score': 5},
        {'text': 'Green', 'score': 2},
      ]
    },
    {
      'question': 'What\'s your favourite city?',
      'choices': <Map<String, Object>>[
        {'text': 'Chennai', 'score': 15},
        {'text': 'Delhi', 'score': 10},
        {'text': 'Bangalore', 'score': 7},
        {'text': 'Mumbai', 'score': 5},
      ]
    },
    {
      'question': 'What\'s your favourite Food?',
      'choices': <Map<String, Object>>[
        {'text': 'Pizza', 'score': 25},
        {'text': 'Burger', 'score': 20},
        {'text': 'Pasta', 'score': 15},
        {'text': 'Pancakes', 'score': 10},
      ]
    },
  ];
  var _index = 0;
  var _totalScore = 0;

  void _buttonClicked(int score) {
    setState(() {
      _totalScore += score;
      _index = (_index + 1);
    });
    print('Button Clicked!');
  }

  @override
  Widget build(BuildContext ctx) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Quiz App!',
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
          width: double.infinity,
          margin: EdgeInsets.all(10.0),
          child: (_index < _questions.length
              ? QuizWidget(
                  _questions,
                  _index,
                  _buttonClicked,
                )
              : ResultWidget(_totalScore)),
        ),
      ),
    );
  }
}
