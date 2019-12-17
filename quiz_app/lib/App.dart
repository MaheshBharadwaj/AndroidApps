import 'package:flutter/material.dart';

import 'Question.dart';
import 'AnswerButton.dart';

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
      _index = (_index + 1) % 3;
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
              Question(_questions[_index]['question']),

              ...(_questions[_index]['choices'] as List<String>).map((choice) {
                return AnswerButton(choice, _buttonClicked);
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
          ),
        ),
      ),
    );
  }
}
