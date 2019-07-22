import 'package:flutter/material.dart';
import '../Model/ImageModel.dart';

class ImageList extends StatelessWidget {
  final List<ImageModel> images;

  ImageList(this.images);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: images.length,
        itemBuilder: (context, int count) {
          return Text(images[count].url, style: TextStyle(fontSize: 25));
        }
    );
  }
}
