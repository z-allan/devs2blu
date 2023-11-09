import 'package:flutter/material.dart';
import 'package:sqlite/models/compras_model.dart';
import 'package:sqlite/repositories/db_sqlite_queries.dart';

typedef OnChangeFunction = void Function(bool showAll);

class AddItemWidget extends StatefulWidget {
  final OnChangeFunction onChange;

  const AddItemWidget({required this.onChange, super.key});

  @override
  State<AddItemWidget> createState() => _AddItemWidgetState();
}

class _AddItemWidgetState extends State<AddItemWidget> {
  bool _showAll = true;

  void _changeCheckBoxValue(bool check) {
    setState(() {
      _showAll = check;
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController addItemController = TextEditingController();
    final GlobalKey<FormState> formAddItem = GlobalKey<FormState>();

    return Form(
      key: formAddItem,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CheckboxMenuButton(
                    value: _showAll,
                    onChanged: (value) async {
                      _changeCheckBoxValue(value!);
                      widget.onChange(value);
                    },
                    child: const Text('Mostrar concluidos')),
              ],
            ),
            TextFormField(
                validator: (value) {
                  if ((value ?? '') == '') return 'Campo não pode ser vazio';
                  return null;
                },
                controller: addItemController,
                onEditingComplete: () {
                  if (formAddItem.currentState!.validate()) {
                    SQLiteQuery.add(ComprasModel(
                        item: addItemController.text, comprado: 0));
                    addItemController.clear();
                    widget.onChange(_showAll);
                  }
                },
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    contentPadding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
                    hintText: 'Novo Item...',
                    suffixIcon: IconButton(
                        onPressed: () {
                          if (formAddItem.currentState!.validate()) {
                            SQLiteQuery.add(ComprasModel(
                                item: addItemController.text, comprado: 0));
                            addItemController.clear();
                            widget.onChange(_showAll);
                          }
                        },
                        icon: const Icon(
                          Icons.save,
                        )))),
          ],
        ),
      ),
    );
  }
}
