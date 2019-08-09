class ImageModel{
  String url;
  String title;

  ImageModel({String url,String title});

  ImageModel.fromJSON(parsedJSON){
    url = parsedJSON['url'];
    title = parsedJSON['title'];
  }



}