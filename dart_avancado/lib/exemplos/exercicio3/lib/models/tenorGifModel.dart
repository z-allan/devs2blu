class TenorGifModel {
  String id = "";
  String title = "";
  String description = "";
  String imageURL = "";

  TenorGifModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.imageURL});

  TenorGifModel.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.title = json["title"];
    this.description = json["content_description"];
    this.imageURL = json["media_formats"]["gif"]["url"];
  }

  String get imageTitle {
    if (!title.isEmpty)
      return title;

    return description;
  }
}
