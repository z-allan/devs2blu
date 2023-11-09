import "package:biblioteca/stores/book_list_store.dart";
import "package:biblioteca/widgets/book_tile.dart";
import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:provider/provider.dart";

import "../widgets/bottom_bart.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Livros"),
        ),
        body: Observer(
          builder: (context) {
            var list = Provider.of<BookListStore>(context).books;

            return GridView(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              children: list.map((e) => BookTile(bookModel: e)).toList(),
            );
          },
        ),
        bottomNavigationBar: BottomBar());
  }
}
