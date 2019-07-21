import 'dart:convert';
import 'package:flutter/material.dart';
import '../Model/ImageModel.dart';

class ImageList extends StatelessWidget{
    List<ImageModel> images = [];

    ImageList(ImageModel imageModel){
      images.add(imageModel);
    }

    @override
  Widget build(BuildContext context) {
      return ListView.builder(
            itemCount: images.length,
            itemBuilder: build(context,int count)(
              bod
            )
      )
  }

}