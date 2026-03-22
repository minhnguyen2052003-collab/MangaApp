
import '../repository/cart_repository.dart';
import '../utils/Manga.dart';

class GetCartUseCase {
  final CartRepository repository;

  GetCartUseCase(this.repository);

  List<Manga> call() {
    return repository.getCartItems();
  }
}
