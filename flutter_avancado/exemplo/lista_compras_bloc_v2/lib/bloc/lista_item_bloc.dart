import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:lista_compras_bloc/models/lista_item_model.dart';
import 'package:lista_compras_bloc/repositories/lista_item_repository.dart';

class ListaItemBloc extends BlocBase {
  bool _showAll = true;

  StreamController<List<ListaItemModel>> _listaController =
      StreamController.broadcast();
  StreamController<bool> _concluidaController = StreamController.broadcast();
  StreamController<bool> _showAllController = StreamController.broadcast();

  // Getters
  Stream<List<ListaItemModel>> get listStream => _listaController.stream;
  Stream<bool> get concluidaStream => _concluidaController.stream;
  Stream<bool> get showAllStream => _showAllController.stream;

  bool get showAll => _showAll;

  set showAll(bool newValue) {
    _showAll = newValue;

    _sendList();
  }

  Future<void> _sendList() async {
    List<ListaItemModel> list = await ListaItemRepository.getAll((_showAll ? null : false));

    try {
      bool concluida = (showAll) && (!list.isEmpty);

      for (ListaItemModel item in list)
        if (!item.comprado) {
          concluida = false;
          break;
        }

      _concluidaController.sink.add(concluida);

      _showAllController.sink.add(_showAll);
    } finally {
      _listaController.sink.add(list);
    }
  }

  ListaItemBloc() {
    _sendList();
  }

  Future<void> addItem(ListaItemModel listaItemModel) async {
    await ListaItemRepository.add(listaItemModel);

    _sendList();
  }

  Future<void> editItem(ListaItemModel listaItemModel) async {
    await ListaItemRepository.edit(listaItemModel);

    _sendList();
  }

  Future<void> deleteItem(ListaItemModel listaItemModel) async {
    await ListaItemRepository.delete(listaItemModel);

    _sendList();
  }

  @override
  void dispose() {
    _listaController.close();

    super.dispose();
  }
}
