import "package:bloc_pattern/bloc_pattern.dart";
import "package:flutter/material.dart";
import "package:lista_compras_bloc/bloc/lista_item_bloc.dart";
import "package:lista_compras_bloc/models/lista_item_model.dart";

class DeleteDialogWidget extends StatelessWidget {
  final ListaItemModel listaItemModel;

  const DeleteDialogWidget({required this.listaItemModel, super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Exclusão"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Deseja realmente excluir:"),
          SizedBox(
            height: 20,
          ),
          Text(
            listaItemModel.item,
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.of(context).pop(), child: Text("Não")),
        TextButton(onPressed: () {
          BlocProvider.getBloc<ListaItemBloc>().deleteItem(listaItemModel);

          Navigator.of(context).pop();
        }, child: Text("Sim"))
      ],
    );
  }
}
