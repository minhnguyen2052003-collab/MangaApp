import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class FavoriteDB {
  static Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _init();
    return _db!;
  }

  Future<Database> _init() async {
    final path = join(await getDatabasesPath(), 'favorite.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
      CREATE TABLE favorites(
            id TEXT PRIMARY KEY,
            type TEXT,
            attributes TEXT,
            rating REAL,
            price INTEGER
          )
      ''');
      },
    );
  }
}
