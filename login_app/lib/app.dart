import 'package:flutter/material.dart';
import 'Screens/login_screen.dart';

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
              'Login Page',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
              ),
          ),
         backgroundColor: Colors.red,
        ),
        body: LoginScreen(),
        backgroundColor: Colors.indigoAccent,
      ),
    );
  }
}