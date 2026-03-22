
import 'package:hive/hive.dart';

import '../utils/Manga.dart';

class CartData {
  final Box<Manga> box;
  CartData(this.box);

  Future<void> saveMangaToCart(Manga manga) async {
    await box.put(manga.id, manga);
  }

  Future<void> deleteMangaFromCart(int id) async {
    await box.delete(id);
  }

  List<Manga> getAllMangaFromCart(){
    return box.values.toList();
  }
}