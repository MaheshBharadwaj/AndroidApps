import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text(
          "My First APP",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white70),
        ),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      backgroundColor: Colors.black,
      body: Container(
        child: Column(
          children: <Widget>[
            Text(
              'Question: ',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 25.0,
              ),
            ),
            RaisedButton(
              color: Colors.blueAccent,
              child: Text(
                'Question 1',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70, fontSize: 15.0),
              ),
              onPressed: null,
            ),
            RaisedButton(
              color: Colors.blueAccent,
              child: Text(
                'Question 2',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70, fontSize: 15.0),
              ),
              onPressed: null,
            ),
            RaisedButton(
              color: Colors.blueAccent,
              child: Text(
                'Question 3',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70, fontSize: 15.0),
              ),
              onPressed: null,
            ),
          ],
        ),
        padding: EdgeInsets.all(10.0),
      ),
    ));
  }
}
