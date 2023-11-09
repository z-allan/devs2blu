import "package:biblioteca/stores/book_list_store.dart";
import "package:biblioteca/stores/book_store.dart";
import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:provider/provider.dart";

import "../models/book_model.dart";

class EditBook extends StatelessWidget {
  final BookStore bookStore = BookStore();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController authorController = TextEditingController();
  final TextEditingController coverController = TextEditingController();

  EditBook({BookModel? bookModel, super.key}) {
    if (bookModel != null) bookStore.fromObject(bookModel);

    nameController.text = bookStore.name;
    authorController.text = bookStore.author;
    coverController.text = bookStore.cover;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: ConstrainedBox(
              constraints:
                  BoxConstraints(maxWidth: (constraints.maxWidth * 0.7)),
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.book_outlined,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Observer(
                              builder: (context) => Text(bookStore.inInsert
                                  ? "Inserir livro"
                                  : "Editar livro")),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: TextFormField(
                        controller: nameController,
                        onChanged: (value) => bookStore.setName(value),
                        decoration: InputDecoration(labelText: "Título"),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 30, right: 30, top: 20),
                      child: TextFormField(
                        controller: authorController,
                        onChanged: (value) => bookStore.setAuthor(value),
                        decoration: InputDecoration(labelText: "Autor"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 30, right: 30, top: 20, bottom: 30),
                      child: TextFormField(
                        controller: coverController,
                        onChanged: (value) => bookStore.setCover(value),
                        decoration:
                            InputDecoration(labelText: "Imagem de capa"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: Observer(
        builder: (context) {
          return FloatingActionButton(
            backgroundColor: (bookStore.canSave ? Colors.purple : Colors.grey),
            onPressed: bookStore.canSave
                ? () async {
                    await bookStore.save();

                    Provider.of<BookListStore>(context, listen: false)
                        .updateList();

                    Navigator.of(context).pop();
                  }
                : null,
            child: Icon(Icons.save),
          );
        },
      ),
    );
  }
}
