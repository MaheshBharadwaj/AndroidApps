import 'package:flutter/material.dart';
import '../models/image_model.dart';

//The class is Stateless as it doesn't change its members from within
class ImageList extends StatelessWidget{
    List<ImageModel> images = [];
    ImageList(this.images);

    Widget build(context){
        return ListView.builder(
          itemCount: images.length,
          itemBuilder: (context,int index){
              return Text(images[index].url,
                          style: TextStyle(color: Colors.black,fontSize: 20),
              );
          },
        );
    }
}