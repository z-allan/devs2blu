import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:produtos/stores/produto_lista_store.dart';
import 'package:produtos/widgets/produto_dialog.dart';
import 'package:produtos/widgets/produto_tile.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Produtos',
          style: TextStyle(shadows: [
            Shadow(blurRadius: 5, color: Colors.blueGrey, offset: Offset(2, 1))
          ]),
        ),
      ),
      body: Observer(builder: (_) {
        var listaProdutos = Provider.of<ProdutoListaStore>(context).produtos;

        return ListView.builder(
          itemCount: listaProdutos.length,
          itemBuilder: (context, index) {
            return ProdutoTileWidget(modelo: listaProdutos[index]);
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => ProdutoDialogWidget(),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
