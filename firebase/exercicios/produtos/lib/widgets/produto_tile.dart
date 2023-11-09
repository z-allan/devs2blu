import 'package:flutter/material.dart';
import 'package:produtos/models/produto_model.dart';
import 'package:produtos/widgets/produto_dialog.dart';

class ProdutoTileWidget extends StatelessWidget {
  final ProdutoModel modelo;

  const ProdutoTileWidget({required this.modelo, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      titleAlignment: ListTileTitleAlignment.center,
      visualDensity: VisualDensity.comfortable,
      leading: Icon(
        Icons.no_photography_outlined,
        color: Colors.grey[800],
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => ProdutoDialogWidget(
            modelo: modelo,
          ),
        );
      },
      title: Text(
        modelo.nome,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      trailing: Text(
        'R\$ ${modelo.preco.toStringAsFixed(2).replaceAll('.', ',')}',
        style: const TextStyle(color: Colors.green, fontSize: 15),
      ),
    );
  }
}
