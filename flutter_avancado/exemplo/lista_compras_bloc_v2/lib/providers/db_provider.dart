import "package:lista_compras_bloc/models/lista_item_model.dart";
import "package:sqflite/sqflite.dart";
import "package:path/path.dart";

class DBProvider {
  // Singleton
  static DBProvider _provider = DBProvider.internal();

  DBProvider.internal(); // Construtor

  factory DBProvider() {
    return _provider;
  }

  // Lógica da criação do banco de dados e persistência
  Database? _database;

  Future<Database> getDatabase() async {
    if (_database != null)
      return _database!;

    _database = await initDB();

    return _database!;
  }

  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    String dbPath = join(path, "show_list.db");

    return await openDatabase(dbPath, version: 1, onCreate: (db, version) async {

      await db.execute(" CREATE TABLE ${LISTA_ITEM_TABLE} ("
          "   ${LISTA_ITEM_ID} INTEGER PRIMARY KEY, "
          "   ${LISTA_ITEM_ITEM} VARCHAR(50), "
          "   ${LISTA_ITEM_COMPRADO} TINYINT"
          ") ");

    },);
  }
}