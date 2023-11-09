import "package:bloc_pattern/bloc_pattern.dart";
import "package:flutter/material.dart";
import "package:lista_compras_bloc/bloc/lista_item_bloc.dart";
import "package:lista_compras_bloc/models/lista_item_model.dart";

class FormDialogWidget extends StatelessWidget {
  final ListaItemModel listaItemModel;

  FormDialogWidget({ required this.listaItemModel, super.key});

  TextEditingController itemController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    itemController.text = listaItemModel.item;

    return AlertDialog(
      title: Text((listaItemModel.id == null ? "Novo item" : "Editar item")),
      content: TextField(
        controller: itemController,
        decoration: InputDecoration(
          labelText: "Item"
        ),
      ),
      actions: [
        TextButton(onPressed: () {
          listaItemModel.item = itemController.text;

          if (listaItemModel.id == null) {
            BlocProvider.getBloc<ListaItemBloc>().addItem(listaItemModel);
          } else {
            BlocProvider.getBloc<ListaItemBloc>().editItem(listaItemModel);
          }

          Navigator.of(context).pop();
        }, child: Text("Salvar"))
      ],
    );
  }
}
