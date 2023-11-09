class NewsModel {
  late String title;
  late String description;
  late String content;
  late String urlToImage;

  NewsModel(
      {required this.title,
      required this.description,
      required this.content,
      required this.urlToImage});

  NewsModel.json(Map item) {
    this.title = item['title'] ?? '';
    this.description = item['description'] ?? '';
    this.content = item['content'] ?? '';
    this.urlToImage = item['urlToImage'] ?? '';
  }
}
