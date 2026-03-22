

import '../utils/Manga.dart';

abstract class FavoriteRepository {
  Future<List<Manga>> getFavorites();
  Future<void> addFavorite(Manga manga);
  Future<void> removeFavorite(String id);
  Future<bool> isFavorite(String id);
}