import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:lista_compras_bloc/models/lista_item_model.dart';
import 'package:lista_compras_bloc/repositories/lista_item_repository.dart';

class ListaItemBloc extends BlocBase {
  StreamController<List<ListaItemModel>> _listaController =
      StreamController.broadcast();

  // Getters
  Stream<List<ListaItemModel>> get listStream => _listaController.stream;

  ListaItemBloc() {
    ListaItemRepository.getAll()
        .then((value) => _listaController.sink.add(value));
  }

  Future<void> addItem(ListaItemModel listaItemModel) async {
    await ListaItemRepository.add(listaItemModel);

    ListaItemRepository.getAll()
        .then((value) => _listaController.sink.add(value));
  }

  Future<void> editItem(ListaItemModel listaItemModel) async {
    await ListaItemRepository.edit(listaItemModel);

    ListaItemRepository.getAll().then((value) => _listaController.sink.add(value));
  }

  Future<void> deleteItem(ListaItemModel listaItemModel) async {
    await ListaItemRepository.delete(listaItemModel);

    List<ListaItemModel> list = await ListaItemRepository.getAll();

    _listaController.sink.add(list);
  }

  @override
  void dispose() {
    _listaController.close();

    super.dispose();
  }
}
