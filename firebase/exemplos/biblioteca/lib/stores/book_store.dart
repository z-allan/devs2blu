import "package:biblioteca/models/book_model.dart";
import "package:biblioteca/repositories/book_repository.dart";
import "package:mobx/mobx.dart";

part "book_store.g.dart";

class BookStore = _BookStore with _$BookStore;

abstract class _BookStore with Store {
  @observable
  String id = "";

  @observable
  String name = "";

  @observable
  String author = "";

  @observable
  String cover = "";

  @computed
  bool get inInsert => id.trim().isEmpty;

  @computed
  bool get canSave =>
      name.trim() != "" &&
      author.trim() != "" &&
      cover.trim() != "";

  @action
  void setName(String value) {
    name = value;
  }

  @action
  void setAuthor(String value) {
    author = value;
  }

  @action
  void setCover(String value) {
    cover = value;
  }

  @action
  void fromObject(BookModel bookModel) {
    id = bookModel.id!;
    name = bookModel.title;
    author = bookModel.author;
    cover = bookModel.cover;
  }

  @action
  Future<void> save() async {
    if (inInsert) {
      await BookRepository.add(
          BookModel(title: name, author: author, cover: cover));
    } else {
      await BookRepository.edit(
          BookModel(title: name, author: author, cover: cover, id: id));
    }
  }
}
