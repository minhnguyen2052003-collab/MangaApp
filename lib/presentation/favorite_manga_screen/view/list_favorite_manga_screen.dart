import 'package:comic_app_gpt/presentation/detail_manga_screen/modelview/favor_manga_controller.dart';
import 'package:comic_app_gpt/presentation/favorite_manga_screen/modelview/favorite_notifier_provider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../detail_manga_screen/modelview/favorite_manga_provider.dart';
import '../../list_manga_screen/widget/manga_item_widget.dart';

class ListFavoriteMangaScreen extends ConsumerWidget {
  const ListFavoriteMangaScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritesState = ref.watch(favoriteProvider);

    return favoritesState.when(
      data: (list) => GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.65, // Tỉ lệ chiều rộng/cao của ô truyện
          crossAxisSpacing: 12,
          mainAxisSpacing: 16,
        ),
        // Cộng thêm 1 ô ở cuối để chứa cái vòng quay Loading khi đang kéo
        itemCount: list.length,
        itemBuilder: (context, index) {
          final manga = list[index];
          return MangaItemWidget(manga: manga);
        },
      ),
      error: (e, _) => Center(child: Text("Error")),
      loading: () => Center(child: CircularProgressIndicator()),
    );
  }
}
