import 'package:flutter/material.dart';

void main() {
  int a = 0;
  var App =MaterialApp(
              home: Scaffold(
                backgroundColor: Colors.indigoAccent,
                floatingActionButton: FloatingActionButton(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.add,
                              color: Colors.black,
                              size: 30),
                  onPressed: (){
                      a += 1;
                      print('Button Pressed $a times');
                  },
                ),
                appBar: AppBar(
                  backgroundColor: Colors.red,
                  title: Text('Trying to create App',
                         style: TextStyle(color: Colors.black))
                ),

              )
           );

  runApp(App);
}