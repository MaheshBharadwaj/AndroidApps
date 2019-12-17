import 'package:flutter/material.dart';
import 'Question.dart';

class MyApp extends StatefulWidget {
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var _questions = ['What\'s your fav color?', 'What\'s your fav animal?'];
  var _index = 0;

  void buttonClicked() {
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
          child: Column(
            children: <Widget>[
              Question(
                _questions[_index],
              ),
              RaisedButton(
                color: Colors.blueAccent,
                child: Text(
                  'Question 1',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white70, fontSize: 15.0),
                ),
                onPressed: buttonClicked,
              ),
              RaisedButton(
                color: Colors.blueAccent,
                child: Text(
                  'Question 2',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white70, fontSize: 15.0),
                ),
                onPressed: buttonClicked,
              ),
              RaisedButton(
                color: Colors.blueAccent,
                child: Text(
                  'Question 3',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white70, fontSize: 15.0),
                ),
                onPressed: buttonClicked,
              ),
            ],
          ),
          padding: EdgeInsets.all(10.0),
        ),
      ),
    );
  }
}
