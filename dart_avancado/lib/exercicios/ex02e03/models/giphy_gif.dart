class GiphyGifModel {
  late String id;
  late String url_complete;
  late String title;
  late String icon_url;
  late String icon_height;
  late String icon_width;

  GiphyGifModel({
    required this.id,
    required this.url_complete,
    required this.title,
    required this.icon_url,
    required this.icon_height,
    required this.icon_width,
  });

  GiphyGifModel.fromJson(Map<String, dynamic> json) {
    String imageType = 'downsized_medium';
    //imageType = 'fixed_width_small';
    this.id = json['id'];
    this.url_complete = json['url'];
    this.title = json['title'];
    this.icon_url = json['images'][imageType]['url'];
    this.icon_height = json['images'][imageType]['height'];
    this.icon_width = json['images'][imageType]['width'];
  }
}
