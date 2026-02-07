import 'package:comic_app_gpt/data/data_source/favorite_local_db.dart';
import 'package:comic_app_gpt/domain/repository/favorite_repository.dart';
import 'package:comic_app_gpt/utils/Manga.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  final FavoriteDB _db = FavoriteDB();

  @override
  Future<void> addFavorite(Manga manga) async {
    final db = await _db.database;
    await db.insert(
      'favorites',
      manga.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<List<Manga>> getFavorites() async {
    final db = await _db.database;
    final maps = await db.query('favorites');

    return maps.map((e) => Manga.fromMap(e)).toList();
  }

  @override
  Future<void> removeFavorite(int id) async{
    final db = await _db.database;

    await db.delete('favorites', where: 'id = ?', whereArgs: [id]);
  }
  @override
  Future<bool> isFavorite(int id) async {
    final db = await _db.database;

    final result =
    await db.query('favorites', where: 'id=?', whereArgs: [id]);

    return result.isNotEmpty;
  }
}
final favoriteRepoProvider = Provider((ref) => FavoriteRepositoryImpl());
