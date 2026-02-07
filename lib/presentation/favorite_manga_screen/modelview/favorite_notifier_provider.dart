import 'package:comic_app_gpt/domain/repository/favorite_repository.dart';
import 'package:comic_app_gpt/utils/Manga.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../../data/repository/favorite_repository_impl.dart';

class FavoriteNotifierProvider extends StateNotifier<List<Manga>>{
  final FavoriteRepository repository;
  FavoriteNotifierProvider(this.repository) : super([]){
    loadFavorites();
  }

  Future<List<Manga>> loadFavorites() async {
    state = await repository.getFavorites();
    return state;

  }
  Future<void> add(Manga manga) async{
    await repository.addFavorite(manga);
    state = [...state,manga];
  }

  Future<void> remove(int id) async {
    await repository.removeFavorite(id);
    state = state.where((e) => e.id != id).toList();
  }
  Future<void> toggleFavorite(Manga manga) async {
    final exists = state.any((e) => e.id == manga.id);

    if (exists) {
      await repository.removeFavorite(int.parse(manga.id));
      state = state.where((e) => e.id != manga.id).toList();
    } else {
      await repository.addFavorite(manga);
      state = [...state, manga];
    }
  }
  bool isFavorite(int id) {
    return state.any((e) => e.id == id);
  }
}


final favoriteProvider =
StateNotifierProvider<FavoriteNotifierProvider, List<Manga>>(
      (ref) => FavoriteNotifierProvider(ref.read(favoriteRepoProvider)),
);