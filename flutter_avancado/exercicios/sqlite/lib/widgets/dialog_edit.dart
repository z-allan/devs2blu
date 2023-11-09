import 'package:flutter/material.dart';
import 'package:sqlite/models/compras_model.dart';

typedef FunctionOnChange = void Function(ComprasModel comprasModel);

class EditDialogWidget extends StatelessWidget {
  final String title;
  final FunctionOnChange onChange;
  final ComprasModel comprasModel;

  const EditDialogWidget(
      {required this.title,
      required this.onChange,
      required this.comprasModel,
      super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController editItemController =
        TextEditingController(text: comprasModel.item);
    final GlobalKey<FormState> formEditItem = GlobalKey<FormState>();

    return Form(
      key: formEditItem,
      child: AlertDialog(
        title: Text(title),
        content: TextFormField(
          validator: (value) {
            if ((value ?? '') == '') return 'Campo não pode ser vazio';
            return null;
          },
          controller: editItemController,
        ),
        actions: [
          TextButton(
              onPressed: () {
                if (formEditItem.currentState!.validate()) {
                  comprasModel.item = editItemController.text;
                  onChange(comprasModel);
                  Navigator.pop(context);
                }
              },
              child: const Text('Salva'))
        ],
      ),
    );
  }
}
