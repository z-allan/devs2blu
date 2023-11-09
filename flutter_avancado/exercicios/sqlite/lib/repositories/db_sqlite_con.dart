import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqlite/models/compras_model.dart';

class DBProvider {
  static final DBProvider _instance = DBProvider.internal();
  factory DBProvider() => _instance;
  DBProvider.internal();
  Database? _db;
  Future<Database> get db async {
    print("Getting db...");
    if (_db != null) return _db!;
    print("Creating db...");
    _db = await initDB();
    return _db!;
  }

  Future<Database> initDB() async {
    final String databasePath = await getDatabasesPath();
    final String path = join(databasePath, "database.db");
    print(path);
    return await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute(
          " CREATE TABLE $COMPRAS_TABLENAME ( $COMPRAS_FIELDID INTEGER PRIMARY KEY, $COMPRAS_FIELDITEM VARCHAR(50), $COMPRAS_FIELDCOMPRADO TINYINT ) ");
    });
  }
}
