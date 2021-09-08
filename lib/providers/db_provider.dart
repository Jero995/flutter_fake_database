import 'dart:io';
import 'package:flutter_database/ui/users/model/user_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  DBProvider._();
  static Database? _database;
  static final DBProvider db = DBProvider._();


  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'user_text.db');

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE userTable (id INTEGER PRIMARY KEY, email TEXT, first_name TEXT, last_name TEXT, avatar TEXT)");
    });
  }

  createUsers(UserModel newUser) async {
    final db = await database;
    final res = await db.insert('userTable', newUser.toJson());
    return res;
  }

  deleteAll() async {
    final db = await database;
    db.delete("userTable");
  }

Future<List<UserModel>> getAllUsers() async {
    final db = await database;
    var res = await db.query("userTable");
    List<UserModel> list =
        res.isNotEmpty ? res.map((c) => UserModel.fromJson(c)).toList() : [];
    return list;
  }
  
  deleteUser(int id) async {
    final db = await database;
    return db.delete("userTable", where: "id = ?", whereArgs: [id]);
  }
}