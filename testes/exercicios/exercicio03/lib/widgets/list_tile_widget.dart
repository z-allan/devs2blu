import 'package:exercicio03/models/item_model.dart';
import 'package:flutter/material.dart';

class ListaTileWidget extends StatelessWidget {
  final ItemModel itemModel;

  const ListaTileWidget({required this.itemModel, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.newspaper),
      title: Text(itemModel.nome),
      subtitle: const Text('Item selecionável'),
      trailing: const Icon(Icons.more_horiz),
    );
  }
}
