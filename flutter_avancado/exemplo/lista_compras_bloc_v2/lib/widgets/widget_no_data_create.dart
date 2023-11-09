import "package:flutter/material.dart";
import "package:lista_compras_bloc/models/lista_item_model.dart";
import "package:lista_compras_bloc/widgets/form_dialog_widget.dart";

class WidgetNoDataCreate extends StatelessWidget {
  const WidgetNoDataCreate({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("Nenhum item ainda inserido..."),
        TextButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => FormDialogWidget(
                      listaItemModel:
                          ListaItemModel(comprado: false, item: "")));
            },
            child: Text("Adicione o primeiro item"))
      ],
    );
  }
}
