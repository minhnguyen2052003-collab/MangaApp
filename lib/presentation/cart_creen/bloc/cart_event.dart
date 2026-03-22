import 'package:comic_app_gpt/domain/repository/cart_repository.dart';

import '../../../domain/utils/Manga.dart';

sealed class CartEvent {}

class AddComicToCart extends CartEvent{
  final Manga manga;
  AddComicToCart(this.manga);
}
class LoadCart extends CartEvent{
}