import 'package:mobx/mobx.dart';
import 'package:produtos/models/produto_model.dart';
import 'package:produtos/repositories/produto_repository.dart';
part 'produto_lista_store.g.dart';

// ignore: library_private_types_in_public_api
class ProdutoListaStore = _ProdutoListaStoreBase with _$ProdutoListaStore;

abstract class _ProdutoListaStoreBase with Store {
  ObservableList<ProdutoModel> produtos = ObservableList();

  _ProdutoListaStoreBase() {
    ProdutoRepository.selecionarTudo().then((value) => produtos.addAll(value));
  }

  @action
  void atualizarLista() {
    produtos.clear();
    ProdutoRepository.selecionarTudo().then((value) => produtos.addAll(value));
  }
}
