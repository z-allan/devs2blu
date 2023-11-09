import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:produtos/models/produto_model.dart';

class ProdutoRepository {
  static Future<List<ProdutoModel>> selecionarTudo() async {
    QuerySnapshot qs =
        await FirebaseFirestore.instance.collection('produtos').get();

    if (qs.docs.isEmpty) return [];

    List<ProdutoModel> lista = [];

    for (var element in qs.docs) {
      lista.add(ProdutoModel.fromJson(
          element.data() as Map<String, dynamic>, element.id));
    }

    return lista;
  }

  static Future<void> adicionar(ProdutoModel pModel) async {
    await FirebaseFirestore.instance
        .collection('produtos')
        .add(pModel.toJson());
  }

  static Future<void> editar(ProdutoModel pModel) async {
    await FirebaseFirestore.instance
        .collection('produtos')
        .doc(pModel.id)
        .update(pModel.toJson());
  }
}
