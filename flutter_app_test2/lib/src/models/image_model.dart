class ImageModel{
  String url;
  String title;
  int id;

  ImageModel(this.id,this.url,this.title);

  //The return type of json.decode is Map<String,dynamic>
  ImageModel.fromJSON(Map<String,dynamic> jsonObj){
    id    = jsonObj['id'];
    url   = jsonObj['url'];
    title = jsonObj['title'];
  }
}