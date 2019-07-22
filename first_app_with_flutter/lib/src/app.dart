import 'package:flutter/material.dart';
import '../Model/ImageModel.dart';
import '../Widgets/ImageList.dart';
import 'package:http/http.dart' show get;
import 'dart:async';
import 'dart:convert';

class App extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App>{
  int a = 0;
  List<ImageModel> images = [];


  void fetchImage() async {
    a++;
    var response = await get('http://jsonplaceholder.typicode.com/photos/$a');

    var imageModel = ImageModel.fromJSON(json.decode(response.body));

    setState(() {
      images.add(imageModel);
    });

  }

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
                home: Scaffold(
                      body: ImageList(images),
                      backgroundColor: Colors.indigoAccent,
                      floatingActionButton: FloatingActionButton(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.add,
                                    color: Colors.black,
                                    size: 30),
                        onPressed: fetchImage,

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