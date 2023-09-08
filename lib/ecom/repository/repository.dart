import 'package:votevoiceconnect/ecom/repository/db_connection.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';
class Repository {

  DatabaseConnection? _connection;

  // final String _baseUrl = 'https://myconstituency.in/aap/api';
  final String _baseUrl = 'https://myconstituency.in/myconstituency/api';


  Repository(){
    _connection = DatabaseConnection();
  }

  static Database? _database;

  Future<Database?> get database async {
    if(_database != null) {
      return _database;
    }
    _database = await _connection!.initDatabase();

    return _database;
  }


  httpGet(String api) async {
    return await http.get(Uri.parse("$_baseUrl/$api"));
  }

  httpGetById(String api, id) async {
    return await http.get(Uri.parse("$_baseUrl/$api/$id"));
  }

  httpPost(String api, data) async {
    return await http.post(Uri.parse("$_baseUrl/$api"), body: data);
  }

  getAllLocal(table) async {
    var conn = await database;
    return await conn!.query(table);
  }

  saveLocal(table, data) async {
    var conn = await database;
    return await conn!.insert(table, data);
  }

  updateLocal(table, columnName, data) async {
    var conn = await database;
    return await conn!.update(table, data, where: '$columnName =?', whereArgs: [data['productId']]);
  }

  getLocalByCondition(table, columnName, conditionalValue) async {
    var conn = await database;
    return await conn!.rawQuery('SELECT * FROM $table WHERE $columnName=?', ['$conditionalValue']);
  }

  deleteLocalById(table, id) async {
    var conn = await database;
    return await conn!.rawDelete("DELETE FROM $table WHERE id = $id");
  }

  deleteLocal(table) async {
    var conn = await database;
    return await conn!.rawDelete("DELETE FROM $table");
  }

}