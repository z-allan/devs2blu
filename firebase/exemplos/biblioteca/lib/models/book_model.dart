class BookModel {
  String? id;
  String title = "";
  String author = "";
  String cover = "";

  BookModel({ required this.title, required this.author, required this.cover, this.id });

  BookModel.fromJson(Map<String, dynamic> json, String prId) {
    title = json["title"];
    author = json["author"];
    cover = json["cover"];

    id = prId;
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "author": author,
      "cover": cover
    };
  }
}