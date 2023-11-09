import 'package:flutter/material.dart';
import 'package:sqlite/models/compras_model.dart';
import 'package:sqlite/repositories/db_sqlite_queries.dart';
import 'package:sqlite/widgets/dialog_edit.dart';
import 'package:sqlite/widgets/dialog_remove.dart';

class CheckBoxTileWidget extends StatelessWidget {
  final ComprasModel comprasModel;
  final VoidCallback onChange;

  const CheckBoxTileWidget(
      {required this.comprasModel, required this.onChange, super.key});

  @override
  Widget build(BuildContext context) {
    bool checked = comprasModel.comprado == 1 ? true : false;

    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: Colors.green,
      title: Text(
        comprasModel.item,
        style: TextStyle(
            color: checked ? Colors.grey : Colors.black,
            decoration:
                checked ? TextDecoration.lineThrough : TextDecoration.none),
      ),
      value: checked ? true : false,
      onChanged: (value) async {
        comprasModel.comprado = value == true ? 1 : 0;
        await SQLiteQuery.edit(comprasModel);
        onChange();
      },
      secondary: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            icon: Icon(
              Icons.edit,
              color: checked ? Colors.grey : Colors.yellow[800],
            ),
            onPressed: () async {
              showDialog(
                  context: context,
                  builder: (context) {
                    return EditDialogWidget(
                        title: 'Editar item..',
                        comprasModel: comprasModel,
                        onChange: (comprasModel) async {
                          await SQLiteQuery.edit(comprasModel);
                          onChange();
                        });
                  });
            },
          ),
          IconButton(
              icon: Icon(
                Icons.delete,
                color: checked ? Colors.red : Colors.grey,
              ),
              onPressed: () async {
                showDialog(
                    context: context,
                    builder: (context) {
                      return RemoveDialogWidget(
                          title: comprasModel.item,
                          content: 'Deseja remover o item?',
                          confirmButtonAction: () async {
                            await SQLiteQuery.delete(comprasModel);
                            onChange();
                          });
                    });
              }),
        ],
      ),
    );
  }
}
