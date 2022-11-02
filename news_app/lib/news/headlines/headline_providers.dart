import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/models/models.dart' show Article;
import 'package:news_app/news/categories/categories.dart';
import 'package:news_app/news_api/news_api.dart';

final defaultHeadlinesProvider = FutureProvider.autoDispose<List<Article>>((ref) async {
  // Get the category selected by the user
  final currentCategory = ref.watch(currentCategoryProvider);

  // Get the repo
  final newsRepo = ref.watch(newsRepositoryProvider);

  // Successful requests should be kept. So, only when a user refreshes the page,
  // do we make the request again
  ref.keepAlive();

  return newsRepo.getHeadlines(category: currentCategory?.name);
});

final customHeadlinesProvider = FutureProvider.autoDispose<List<Article>>((ref) async {
  return [];
});