import 'package:exercicio03/models/item_model.dart';

class ListaItemModel {
  final List<ItemModel> _lista = [];

  void addLista(ItemModel item) {
    _lista.add(item);
  }

  List<ItemModel> get getLista => _lista;
}
