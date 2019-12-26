import 'package:flutter/material.dart';

import './Widgets/HomeWidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      home: HomeWidget(),
    );
  }
}
