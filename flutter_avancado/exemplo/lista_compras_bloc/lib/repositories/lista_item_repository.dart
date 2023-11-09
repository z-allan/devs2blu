import 'package:lista_compras_bloc/models/lista_item_model.dart';
import 'package:lista_compras_bloc/providers/db_provider.dart';
import 'package:sqflite/sqflite.dart';

class ListaItemRepository {
  static Future<void> add(ListaItemModel listaItemModel) async {
    DBProvider dbProvider = DBProvider();

    Database database = await dbProvider.getDatabase();

    await database.insert(LISTA_ITEM_TABLE, listaItemModel.toJson());
  }

  static Future<void> edit(ListaItemModel listaItemModel) async {
    DBProvider dbProvider = DBProvider();

    Database database = await dbProvider.getDatabase();

    await database.update(LISTA_ITEM_TABLE, listaItemModel.toJson(),
        where: " ${LISTA_ITEM_ID} = ? ", whereArgs: [listaItemModel.id]);
  }

  static Future<void> delete(ListaItemModel listaItemModel) async {
    DBProvider dbProvider = DBProvider();

    Database database = await dbProvider.getDatabase();

    await database.delete(
        LISTA_ITEM_TABLE, where: " ${LISTA_ITEM_ID} = ? ", whereArgs: [
      listaItemModel.id
    ]);
  }

  static Future<List<ListaItemModel>> getAll() async {
    DBProvider dbProvider = DBProvider();

    Database database = await dbProvider.getDatabase();

    var result = await database.query(LISTA_ITEM_TABLE);

    List<ListaItemModel> itens = [];

    result.forEach((element) => itens.add(ListaItemModel.fromJson(element)));
    
    return itens;
  }

  static Future<ListaItemModel?> getById(int id) async {
    DBProvider dbProvider = DBProvider();

    Database database = await dbProvider.getDatabase();

    var result = await database.query(LISTA_ITEM_TABLE, where: " ${LISTA_ITEM_ID} = ? ", whereArgs: [
      id
    ]);

    if (result.isEmpty)
      return null;

    return ListaItemModel.fromJson(result.first);
  }
}
