import "package:biblioteca/repositories/book_repository.dart";
import "package:mobx/mobx.dart";

import "../models/book_model.dart";
part "book_list_store.g.dart";

class BookListStore = _BookListStore with _$BookListStore;

abstract class _BookListStore with Store {
  ObservableList<BookModel> books = ObservableList();

  _BookListStore() {
    BookRepository.getAll().then((value) => books.addAll(value));
  }

  @action
  void updateList() {
    books.clear();

    BookRepository.getAll().then((value) => books.addAll(value));
  }
}