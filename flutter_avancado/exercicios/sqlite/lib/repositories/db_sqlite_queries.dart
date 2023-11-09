import 'package:sqlite/models/compras_model.dart';
import 'package:sqlite/repositories/db_sqlite_con.dart';

class SQLiteQuery {
  static Future<void> add(ComprasModel comprasModel) async {
    DBProvider dbProvider = DBProvider();
    var db = await dbProvider.db;
    db.insert(COMPRAS_TABLENAME, comprasModel.toJson());
  }

  static Future<void> edit(ComprasModel comprasModel) async {
    DBProvider dbProvider = DBProvider();
    var db = await dbProvider.db;
    db.update(COMPRAS_TABLENAME, comprasModel.toJson(),
        where: " $COMPRAS_FIELDID = ? ", whereArgs: [comprasModel.id]);
  }

  static Future<void> delete(ComprasModel comprasModel) async {
    DBProvider dbProvider = DBProvider();
    var db = await dbProvider.db;
    await db.delete(COMPRAS_TABLENAME,
        where: " $COMPRAS_FIELDID = ? ", whereArgs: [comprasModel.id]);
  }

  static Future<List<ComprasModel>> getAll() async {
    DBProvider dbProvider = DBProvider();
    var db = await dbProvider.db;
    var qryList = await db.query(COMPRAS_TABLENAME);
    List<ComprasModel> list = [];
    for (var element in qryList) {
      list.add(ComprasModel.fromJson(element));
    }
    return list;
  }

  static Future<List<ComprasModel>> getPending() async {
    DBProvider dbProvider = DBProvider();
    var db = await dbProvider.db;
    var qryList =
        await db.query(COMPRAS_TABLENAME, where: ' $COMPRAS_FIELDCOMPRADO = 0');
    List<ComprasModel> list = [];
    for (var element in qryList) {
      list.add(ComprasModel.fromJson(element));
    }
    return list;
  }

  static Future<ComprasModel?> getById(int id) async {
    DBProvider dbProvider = DBProvider();
    var db = await dbProvider.db;
    var res = await db.query(COMPRAS_TABLENAME,
        where: " $COMPRAS_FIELDID = ? ", whereArgs: [id]);
    if (res.isEmpty) return null;
    return ComprasModel.fromJson(res.first);
  }
}
