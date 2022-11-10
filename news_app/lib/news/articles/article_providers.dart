import 'dart:async';
import 'dart:math' show Random;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/news/news.dart';
import 'package:news_app/news_api/news_api.dart';

final allArticlesProvider = FutureProvider.autoDispose<List<Article>>((ref) async {
  // Get the category selected by the user
  final currentCategory = ref.watch(currentCategoryProvider);

  final newsRepo = ref.watch(newsRepositoryProvider);

  ref.keepAlive();

  final randomInt = Random().nextInt(ArticleCategory.values.length);

  return newsRepo.getAllArticles(category: currentCategory?.name ?? ArticleCategory.values[randomInt].name);
});

final searchResultsProvider = FutureProvider.autoDispose<List<Article>>((ref) async {
  return [];
});

class ArticlesNotifier extends AutoDisposeAsyncNotifier<List<Article>> {
  @override
  FutureOr<List<Article>> build() {
    // Get the category selected by the user
    final currentCategory = ref.watch(currentCategoryProvider);

    final newsRepo = ref.watch(newsRepositoryProvider);

    ref.keepAlive();

    final randomInt = Random().nextInt(ArticleCategory.values.length);

    return newsRepo.getAllArticles(category: currentCategory?.name ?? ArticleCategory.values[randomInt].name);
  }

  @override
  Future<List<Article>> update(FutureOr<List<Article>> Function(List<Article> p1) cb, {FutureOr<List<Article>> Function(Object err, StackTrace stackTrace)? onError}) {
    // TODO: implement update
    return super.update(cb);
  }

  // void bookmarkArticle(Article article, bool isSaved) async {
  //   state = const AsyncLoading();
  //   state = await AsyncValue.guard(
  //     state
  //         .map(
  //           (thisArticle) => thisArticle.uuid == article.uuid
  //               ? thisArticle.copy(
  //                   isSaved: isSaved,
  //                 )
  //               : thisArticle, data: (AsyncData<List<Article>> data) {  },
  //         )
  //         .toList(),
  //   );
  // }
}

class FormerArticlesNotifier extends StateNotifier<List<Article>> {
  FormerArticlesNotifier({required List<Article> fetchedArticles}) : super(fetchedArticles);

  void update(Article article, bool isSaved) {
    state = state
        .map(
          (thisArticle) => thisArticle.uuid == article.uuid
              ? thisArticle.copy(
                  isSaved: isSaved,
                )
              : thisArticle,
        )
        .toList();
  }
}
