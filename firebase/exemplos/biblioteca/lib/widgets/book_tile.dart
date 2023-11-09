import "package:biblioteca/models/book_model.dart";
import "package:flutter/material.dart";

class BookTile extends StatelessWidget {
  final BookModel bookModel;

  const BookTile({required this.bookModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.network(
            bookModel.cover,
            height: 180,
          ),
          SizedBox(height: 10,),
          Text(bookModel.title, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
          Text("de ${bookModel.author}", style: TextStyle(fontSize: 12),)
        ],
      ),
    );
  }
}
