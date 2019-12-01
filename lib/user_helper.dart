import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final String userTable = "userTable";
final String idColumn = "idColumn";
final String nameColumn = "nameColumn";
final String typeColumn = "typeColumn";
final String descriptionColumn = "descriptionColumn";
final String imgColumn = "imgColumn";

class UserHelper {
  static final UserHelper _instance =  UserHelper.internal();

  factory UserHelper() => _instance;

   UserHelper.internal();

  Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await initDb();
      return _db;
    }
  }

  Future<Database> initDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, "usersnew.db");

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
      await db.execute(
          "CREATE TABLE $userTable($idColumn INTEGER PRIMARY KEY, $nameColumn TEXT, $typeColumn TEXT,"
          "$descriptionColumn TEXT, $imgColumn TEXT)");
    });
  }

  Future<User> saveUser(User  user) async {
    Database dbUser = await db;
    user.id = await dbUser.insert(userTable, user.toMap());
    return user;
  }

  Future<User> getUser(int id) async {
    Database dbUser = await db;
    List<Map> maps = await dbUser.query(userTable,
        columns: [idColumn, nameColumn, typeColumn, descriptionColumn, imgColumn],
        where: "$idColumn = ?",
        whereArgs: [id]);
    if (maps.length > 0) {
      return User.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<int> deleteUser(int id) async {
    Database dbUser = await db;
    return await dbUser.delete(userTable, where: "$idColumn = ?", whereArgs: [id]);
  }

  Future<int> updateUser(User user) async {
    Database dbUser = await db;
    return await dbUser.update(userTable, user.toMap(),
        where: "$idColumn = ?", 
        whereArgs: [user.id]);
  }

  Future<List>getAllUsers() async {
    Database dbUser = await db;
    List listMap = await dbUser.rawQuery("SELECT * FROM $userTable");
    List< User> listUser = List();
    for(Map m in listMap){
      listUser.add(User.fromMap(m));
    }
    return listUser;
  }

  Future<int> getNumber() async{
    Database dbUser = await db;
    return Sqflite.firstIntValue(await dbUser.rawQuery("SELECT COUNT(*) FROM $userTable"));
  }

  Future close() async {
    Database dbUser = await db;
    dbUser.close();
  }
}

class User {
  int id;
  String name;
  String type;
  String description;
  String img;

  User ();

  User.fromMap(Map map) {
    id = map[idColumn];
    name = map[nameColumn];
    type = map[typeColumn];
    description = map[descriptionColumn];
    img = map[imgColumn];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      nameColumn: name,
      typeColumn: type,
      descriptionColumn: description,
      imgColumn: img
    };
    if (id != null) {
      map[idColumn] = id;
    }
    return map;
  }

  @override
  String toString() {
    return "User(id: $id, name: $name, type: $type, description: $description, img: $img";
  }
}

