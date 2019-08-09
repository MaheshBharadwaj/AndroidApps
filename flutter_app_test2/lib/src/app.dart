//import helper library
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' show get;
import 'dart:async';
import 'models/image_model.dart';
import 'widgets/ImageList.dart';

class App extends StatefulWidget{
  State createState(){
    return AppState();
  }
}


class AppState extends State<App>{

  int counter = 0;
  List<ImageModel> images = [];


  //Function to be called during the event of button press
  void fetchImage() async {
      counter++;
      //Fetching response from get method
      var response = await get('https://jsonplaceholder.typicode.com/photos/$counter');

      //Creating an instance of ImageModel from the data received earlier.
      var imageModel = ImageModel.fromJSON(json.decode(response.body));

      //Since we need the widget to refresh with each onPressed, we call setState()
      setState( (){
        //Appending each ImageModel object we get to the list.
        images.add(imageModel);
      });

   }



  Widget build(BuildContext context){

    return MaterialApp(
        home: Scaffold(
                  backgroundColor: Colors.black,
                  body: ImageList(images),
                  floatingActionButton: FloatingActionButton(
                      child: Icon(Icons.add,
                                  size: 30
                                  ),
                      onPressed: fetchImage //Reference to the function.
                  ),
                  appBar: AppBar(
                      centerTitle: true ,
                      backgroundColor: Colors.redAccent,
                      title: Text('Generate Images!',
                             style: TextStyle(
                                 color: Colors.white70,
                                 fontSize: 25,
                               )
                      ),
                  ),
              ),

    );
  }

 }

