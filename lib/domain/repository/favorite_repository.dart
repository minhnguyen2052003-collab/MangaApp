import 'package:comic_app_gpt/utils/Manga.dart';

abstract class FavoriteRepository {
  Future<List<Manga>> getFavorites();
  Future<void> addFavorite(Manga manga);
  Future<void> removeFavorite(int id);
  Future<bool> isFavorite(int id);
}