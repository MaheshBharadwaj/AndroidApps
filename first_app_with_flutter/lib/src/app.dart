import 'package:flutter/material.dart';

class App extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App>{
  int a = 0;
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
                home: Scaffold(
                      body: Text('Button pressed $a times',
                            style: TextStyle(
                            color: Colors.black,
                            fontSize: 25)
                           ),
                      backgroundColor: Colors.indigoAccent,
                      floatingActionButton: FloatingActionButton(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.add,
                                    color: Colors.black,
                                    size: 30),
                        onPressed: (){ //takes the reference of a function which calls setState method.
                          setState(() {
                            a += 1;
                          });
                        }
                      ),
                      appBar: AppBar(
                          backgroundColor: Colors.red,
                          title: Text('Trying to create App',
                                      style: TextStyle(
                                          color: Colors.black))
                      ),

                  )
              );

  }
}