import 'dart:async';

import 'package:comic_app_gpt/data/data_source/favorite_local_db.dart';
import 'package:comic_app_gpt/domain/repository/favorite_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../../data/repository/favorite_repository_impl.dart';
import '../../../domain/utils/Manga.dart';

class FavoriteNotifier extends AsyncNotifier<List<Manga>>{
  FavoriteRepositoryImpl get repository =>
      ref.read(favoriteRepoProvider);

  @override
  FutureOr<List<Manga>> build() {
    return repository.getFavorites();
  }


  Future<void> addFavorite (Manga manga) async{
    await repository.addFavorite(manga);
    state = AsyncData(await build());
  }

  Future<void> remove(String id) async {
    await repository.removeFavorite(id);
    state = AsyncData(await build());
  }
  Future<void> toggleFavorite(Manga manga) async {
    final current = state.value ?? [];
    final exist = current.any((e) => e.id == manga.id);
    if(exist){
      await repository.removeFavorite(manga.id);

    }else{
      await repository.addFavorite(manga);
    }
    final newList = await repository.getFavorites();

    state = AsyncData(newList);
  }

}


final favoriteProvider =
AsyncNotifierProvider<FavoriteNotifier, List<Manga>>(
    FavoriteNotifier.new
);