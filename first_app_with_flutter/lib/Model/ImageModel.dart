import 'package:flutter/material.dart';

class ImageModel{
  String url;
  int id;
  String title;

  ImageModel(this.id,this.url,this.title);

  ImageModel.fromJSON(parsedJSON){
    this.id   = parsedJSON['id'];
    this.url  = parsedJSON['url'];
    this.title= parsedJSON['title'];
  }

}