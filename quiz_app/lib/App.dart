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
      'choices': <String>['Red', 'Orange', 'Blue', 'Green']
    },
    {
      'question': 'What\'s your favourite city?',
      'choices': <String>['Chennai', 'Delhi', 'Goa', 'Bangalore']
    },
    {
      'question': 'What\'s your favourite Food?',
      'choices': <String>['Pizza', 'Pasta', 'Noodles', 'Burger']
    },
  ];
  var _index = 0;

  void _buttonClicked() {
    setState(() {
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
              : ResultWidget()),
        ),
      ),
    );
  }
}
