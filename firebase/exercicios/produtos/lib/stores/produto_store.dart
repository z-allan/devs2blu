import 'package:mobx/mobx.dart';
import 'package:produtos/models/produto_model.dart';
import 'package:produtos/repositories/produto_repository.dart';
part 'produto_store.g.dart';

// ignore: library_private_types_in_public_api
class ProdutoStore = _ProdutoStoreBase with _$ProdutoStore;

abstract class _ProdutoStoreBase with Store {
  @observable
  String id = "";

  @observable
  String nome = "";

  @observable
  double preco = 0;

  @computed
  bool get ehInsercao => id.trim().isEmpty;

  @computed
  bool get podeSalver => nome.trim() != "" && preco != 0;

  @action
  void setName(String valor) {
    nome = valor;
  }

  @action
  void setPreco(double valor) {
    preco = valor;
  }

  @action
  void fromObjeto(ProdutoModel modelo) {
    id = modelo.id!;
    nome = modelo.nome;
    preco = modelo.preco;
  }

  @action
  Future<void> salvar() async {
    if (ehInsercao) {
      await ProdutoRepository.adicionar(ProdutoModel(nome: nome, preco: preco));
    } else {
      await ProdutoRepository.editar(
          ProdutoModel(nome: nome, preco: preco, id: id));
    }
  }
}
