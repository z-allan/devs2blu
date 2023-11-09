import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/book_model.dart';

class BookRepository {
  static Future<List<BookModel>> getAll() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("books")
        .orderBy("title")
        .get();

    if (querySnapshot.docs.isEmpty) return [];

    List<BookModel> list = [];

    querySnapshot.docs.forEach((element) {
      list.add(BookModel.fromJson(
          element.data() as Map<String, dynamic>, element.id));
    });

    return list;
  }

  static Future<void> add(BookModel bookModel) async {
    await FirebaseFirestore.instance
        .collection("books")
        .add(bookModel.toJson());
  }

  static Future<void> edit(BookModel bookModel) async {
    await FirebaseFirestore.instance
        .collection("books")
        .doc(bookModel.id)
        .update(bookModel.toJson());
  }
}
