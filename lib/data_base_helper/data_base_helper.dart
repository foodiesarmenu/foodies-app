//video link: https://www.youtube.com/watch?v=nQl4uACCYcc

/*import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper{

  static Future<Database> _openDatabase() async{
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'my_database.db');
    return openDatabase(path, version: 1, onCreate: _createDatabase);
  }

  static Future<void> _createDatabase(Database db, int version) async{
    await db.execute('''
    CREATE TABLE IF NOT EXISTS users(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      age INTEGER
    )
 
    ''');
  }

  static Future<int> insertUser(String name, int age) async{
    final db = await _openDatabase();
    final data = {
      'name': name,
      'age': age,
    };
    return await db.insert('users', data);
  }



}*/