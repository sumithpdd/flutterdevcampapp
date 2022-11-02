import 'dart:math' show Random;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/models/models.dart' show Article;
import 'package:news_app/news/categories/categories.dart';
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