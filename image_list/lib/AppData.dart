import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' show get;

import 'ImageHandling/ImageList.dart';
import 'ImageHandling/ImageModel.dart';

class App extends StatefulWidget{
    @override
    State<StatefulWidget> createState() {
      return AppState();
    }
}


class AppState extends State<App> {
  int counter = 1;
  List<ImageModel> images = [];

  void fetchImage() async {
    counter++;
    var response = await get(
        'http://jsonplaceholder.typicode.com/photos/$counter');

    setState(() {
      images.add(ImageModel.fromJSON(json.decode(response.body)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigoAccent,
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: Text('Generating Images!',
            style: TextStyle(color: Colors.black,
                fontSize: 20.0),
          ),
          centerTitle: true,
        ),
        body: ImageList(images),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add, size: 25.0, color: Colors.black),
            backgroundColor: Colors.grey,
            onPressed: fetchImage
        ),
      ),
    );
  }

}
