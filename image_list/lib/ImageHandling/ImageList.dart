import 'package:flutter/material.dart';
import 'ImageModel.dart';

class ImageList extends StatelessWidget{
    final List<ImageModel> images;

    ImageList(this.images);

    Widget buildImage(ImageModel imageModel) {
        return Container(
          decoration: BoxDecoration(
              border: Border.all(width: 3.0),
              borderRadius: BorderRadius.circular(3.5)
          ),
          padding: EdgeInsets.all(5.0),
          margin: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Image.network(imageModel.url),
              Padding(padding: EdgeInsets.all(10.0)),
              Text(imageModel.title,
                   style: TextStyle(color: Colors.black,fontSize: 15.0)
              )
            ],
          ) 
        );   
    }


    @override
  Widget build(BuildContext context) {
      return ListView.builder(
          itemCount: images.length,
          itemBuilder: (context,int index){
            return buildImage(images[index]);
          }
      );
  }

}