class ProfileModel {
  //Field
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  //Constucture
  ProfileModel(this.albumId,this.id,this.title,this.url,this.thumbnailUrl);
  ProfileModel.formAPI(Map<String,dynamic> formjson){
    albumId = formjson['albumId'];
    id = formjson['id'];
    title = formjson['title'];
    url = formjson['url'];
    thumbnailUrl = formjson['thumbnailUrl'];

  }

}