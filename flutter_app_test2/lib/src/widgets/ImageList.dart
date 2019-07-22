import 'package:flutter/material.dart';
import '../models/image_model.dart';

//The class is Stateless as it doesn't change its members from within
class ImageList extends StatelessWidget{
    final List<ImageModel> images;
    ImageList(this.images);

    Widget build(context){
        return ListView.builder(
          itemCount: images.length,
          itemBuilder: (context,int index){
              return Container(
                      decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(3.5)),
                                  border: Border.all(
                                    color: Colors.white,
                                    style : BorderStyle.solid,
                                    width: 4.0,
                                  )
                      ),
                      padding: EdgeInsets.all(10.0),
                      margin: EdgeInsets.all(20.0),//All - all sides
                      child : Image.network(images[index].url)
              );
          },
        );
    }
}