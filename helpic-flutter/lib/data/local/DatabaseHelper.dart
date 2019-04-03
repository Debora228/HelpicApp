import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final _databaseName = "PixaBayFlutter.db";
  static final _databaseVersion = 1;


  final table_favourites = 'favourites';
  final table_downloads = 'downloads';


  static final columnId = 'id';


  static final fav_columnUserName = 'username';
  static final fav_columnComments = 'comments';
  static final fav_columnDownloads = 'downloads';
  static final fav_columnLikes = 'likes';
  static final fav_columnUserImage = 'userImage';
  static final fav_columnContentUrl = 'contentUrl';
  static final fav_columnIsVideo = 'isVideo';
  static final fav_columnTags = 'tags';


  static final downloads_columnCaption = 'caption';
  static final downloads_columnIsVideo = 'is_video';
  static final downloads_columnURL = 'url';


  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();


  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await _initDatabase();
    return _database;
  }


  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }


  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table_favourites (
            $columnId INTEGER PRIMARY KEY,
            $fav_columnUserName TEXT NOT NULL,
            $fav_columnComments TEXT NOT NULL,
            $fav_columnDownloads TEXT NOT NULL,
            $fav_columnLikes TEXT NOT NULL,
            $fav_columnUserImage TEXT NOT NULL,
            $fav_columnContentUrl TEXT NOT NULL,
            $fav_columnIsVideo TEXT NOT NULL,
            $fav_columnTags TEXT NOT NULL
          )
          ''');

    await db.execute('''
          CREATE TABLE $table_downloads (
            $columnId INTEGER PRIMARY KEY,
            $downloads_columnCaption TEXT NOT NULL,
            $downloads_columnIsVideo TEXT NOT NULL,
            $downloads_columnURL TEXT NOT NULL
          )
          ''');
  }



  Future<int> insertOrUpdate(Map<String, dynamic> row, String tableName) async {
    Database db = await instance.database;

    int id = row[columnId];

    List<Map> maps = await queryAllRowsWhere(tableName, id);


    var result;
    if (maps.length > 0) {
      result = update(row, tableName);
    } else {
      result = insert(row, tableName);
    }

    return result;
  }


  Future<int> insert(Map<String, dynamic> row, String tableName) async {
    Database db = await instance.database;
    return await db.insert(tableName, row);
  }


  Future<List<Map<String, dynamic>>> queryAllRows(String tableName) async {
    Database db = await instance.database;
    return await db.query(tableName);
  }


  Future<List<Map<String, dynamic>>> queryAllRowsWhere(
      String tableName, int id) async {
    Database db = await instance.database;
    return await db.query(tableName,
        columns: [columnId], where: '$columnId = ?', whereArgs: [id]);
  }


  Future<int> queryRowCount(String tableName) async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $tableName'));
  }


  Future<int> update(Map<String, dynamic> row, String tableName) async {
    Database db = await instance.database;
    int id = row[columnId];
    return await db
        .update(tableName, row, where: '$columnId = ?', whereArgs: [id]);
  }


  Future<int> delete(int id, String tableName) async {
    Database db = await instance.database;
    return await db.delete(tableName, where: '$columnId = ?', whereArgs: [id]);
  }
}
