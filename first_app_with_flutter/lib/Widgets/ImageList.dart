import 'package:flutter/material.dart';

import '../Model/ImageModel.dart';


class ImageList extends StatelessWidget {
  final List<ImageModel> images;

  ImageList(this.images);

  Widget buildImage(ImageModel imageModel){
    return  Container(
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.5),
                  border: Border.all(
                    color: Colors.black,
                    width: 3.0,
                  ),
              ),
              child: Column(
                children: <Widget>[
                  Image.network(imageModel.url),
                  Padding(padding: EdgeInsets.only(bottom: 7.5)),
                  Text(
                    imageModel.title,
                    style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.white),
                        ),
                ],
              )
             );
  }


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: images.length,
        itemBuilder: (context, int count) {
          return buildImage(images[count]);
        }
    );
  }
}
