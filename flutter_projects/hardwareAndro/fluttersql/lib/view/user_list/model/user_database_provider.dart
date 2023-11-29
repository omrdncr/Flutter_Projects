import 'package:fluttersql/view/user_list/model/user_model.dart';
import 'package:sqflite/sqflite.dart';

class UserDatabaseProvider {
  String _userDatabaseName = "userDatabse";
  String userTableName = "user";
  Database? database;
  String columnUserName = "userName";
  String columnAge = "age";
  String columnIsMarried = "isMarried";
  String columnID = "id";
  void open() async {
    database = await openDatabase(
      _userDatabaseName,
      version: _version,
      onCreate: (db, version) {
        createTable(db);
      },
    );
  }

  void createTable(Database db) {
    db.execute(
      '''CREATE TABLE $userTableName (
        $columnID INTEGER PRIMARY KEY AUTOINCREMENT,
          $columnUserName VARCHAR(20),
          $columnAge INTEGER,
          $columnAge BOOLEAN )
          ''',
    );
  }

  Future<List<UserModel>> getList() async {
    List<Map> userMaps = await database.query(_userTableName);
    return userMaps.map((e) => UserModel.fromJson(e)).toList();
  }

  Future<List<UserModel>> getItem(int id) async {
    Map userMaps = await database
        .query(_userTableName, where: '$columnID = ?', whereArgs: [id]);
  }
}
