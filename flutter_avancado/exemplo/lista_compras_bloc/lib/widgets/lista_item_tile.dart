import "package:bloc_pattern/bloc_pattern.dart";
import "package:flutter/material.dart";
import "package:lista_compras_bloc/bloc/lista_item_bloc.dart";
import "package:lista_compras_bloc/models/lista_item_model.dart";
import "package:lista_compras_bloc/widgets/delete_dialog_widget.dart";
import "package:lista_compras_bloc/widgets/form_dialog_widget.dart";

class ListaItemTile extends StatelessWidget {
  final ListaItemModel listaItemModel;

  const ListaItemTile({required this.listaItemModel, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) =>
              FormDialogWidget(listaItemModel: listaItemModel),
        );
      },
      leading: Checkbox(
        value: listaItemModel.comprado,
        onChanged: (value) {
          listaItemModel.comprado = (value ?? false);

          BlocProvider.getBloc<ListaItemBloc>().editItem(listaItemModel);
        },
      ),
      title: Text(listaItemModel.item),
      trailing: IconButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) =>
                  DeleteDialogWidget(listaItemModel: listaItemModel));
        },
        icon: Icon(
          Icons.delete,
          color: Colors.red,
        ),
      ),
    );
  }
}
