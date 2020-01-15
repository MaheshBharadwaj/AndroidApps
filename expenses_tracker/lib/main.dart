import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './Widgets/HomeWidget.dart';

void main() {
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          textTheme: TextTheme(
            title: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        primaryColor: Colors.black,
        accentColor: Colors.white10,
        primaryTextTheme: TextTheme(
          caption: TextStyle(
            fontSize: 15.0,
            color: Colors.white,
          ),
          body2: TextStyle(
            color: Colors.green,
            fontSize: 15.0,
          ),
          body1: TextStyle(
            fontSize: 20.0,
            color: Colors.white70,
          ),
          button: TextStyle(
              color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
          title: TextStyle(
            color: Colors.white,
            fontSize: 22.5,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      title: 'Personal Expenses',
      home: HomeWidget(),
    );
  }
}
