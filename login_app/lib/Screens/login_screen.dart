import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen>{

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Enter E-Mail address',
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 20.0
        ),
        hintText: 'example@sample.com',
        hintStyle: TextStyle(
          color: Colors.white70,
          fontSize: 20.0,
        )
      ),
    );
  }

  Widget passField(){
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Example@123',
        hintStyle: TextStyle(
          color: Colors.white70,
          fontSize: 20.0,
        ),
      labelText: 'Enter Password',
      labelStyle: TextStyle(
        color: Colors.black,
        fontSize: 20.0,
        ),
      ),
    );
  }

  Widget submitButton(){
    return RaisedButton(
      child: Text('Submit!'),
      onPressed: (){
        print('Hello!\n');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Form(
        child: Column(
          children: <Widget>[
            emailField(),
            Padding(padding: EdgeInsets.only(bottom:7.5)),
            passField(),
            Padding(padding: EdgeInsets.only(bottom:7.5)),
            submitButton(),
          ],
          ),
      ),
    );
  }
}