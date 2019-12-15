import 'package:flutter/material.dart';

class MyApp extends StatelessWidget{
    Widget build(BuildContext ctx){
        return MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              title: Text("My First APP",textAlign: TextAlign.center,style: TextStyle(color: Colors.white70)),
              centerTitle: true,
              backgroundColor: Colors.redAccent,
            ),
            backgroundColor: Colors.black,

          ),
        );
    }
}
