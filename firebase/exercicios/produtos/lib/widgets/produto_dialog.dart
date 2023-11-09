import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:produtos/models/produto_model.dart';
import 'package:produtos/stores/produto_lista_store.dart';
import 'package:produtos/stores/produto_store.dart';
import 'package:provider/provider.dart';

class ProdutoDialogWidget extends StatelessWidget {
  final ProdutoStore produtoStore = ProdutoStore();
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController precoController = TextEditingController();

  ProdutoDialogWidget({ProdutoModel? modelo, super.key}) {
    if (modelo != null) produtoStore.fromObjeto(modelo);

    nomeController.text = produtoStore.nome;
    precoController.text = produtoStore.preco.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Observer(
        builder: (_) {
          return produtoStore.ehInsercao
              ? const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      Icon(
                        Icons.add_shopping_cart_rounded,
                        size: 25,
                      ),
                      SizedBox(width: 5),
                      Text("Inserir Produto", style: TextStyle(fontSize: 20))
                    ])
              : const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      Icon(
                        Icons.edit_note_rounded,
                        size: 35,
                      ),
                      SizedBox(width: 5),
                      Text("Editar Produto", style: TextStyle(fontSize: 20))
                    ]);
        },
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              keyboardType: TextInputType.text,
              controller: nomeController,
              onChanged: (value) => produtoStore.setName(value),
              decoration: const InputDecoration(
                labelText: 'Nome',
                prefixIcon: Align(
                  heightFactor: 0.5,
                  widthFactor: 0.5,
                  child: Icon(
                    Icons.abc_outlined,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: [
                CurrencyTextInputFormatter(
                    decimalDigits: 2,
                    locale: 'pt_BR',
                    enableNegative: false,
                    name: '',
                    symbol: 'R\$')
              ],
              controller: precoController,
              onChanged: (value) {
                var valor = value
                    .replaceAll('R\$', '')
                    .replaceAll('.', '')
                    .replaceAll(',', '.');
                produtoStore.setPreco(double.tryParse(valor.trim()) ?? 0);
              },
              decoration: const InputDecoration(
                  labelText: 'Preço',
                  prefixIcon: Align(
                    heightFactor: 0.5,
                    widthFactor: 0.5,
                    child: Icon(
                      Icons.attach_money_rounded,
                      size: 30,
                    ),
                  )),
            ),
          ),
        ],
      ),
      actions: [
        Observer(
          builder: (context) {
            return FloatingActionButton(
              backgroundColor:
                  produtoStore.podeSalver ? Colors.green : Colors.grey,
              onPressed: produtoStore.podeSalver
                  ? () async {
                      await produtoStore.salvar();
                      if (context.mounted) {
                        Provider.of<ProdutoListaStore>(context, listen: false)
                            .atualizarLista();
                        Navigator.of(context).pop();
                      }
                    }
                  : null,
              child: Icon(
                Icons.save,
                color: Colors.grey[300],
              ),
            );
          },
        )
      ],
    );
  }
}
