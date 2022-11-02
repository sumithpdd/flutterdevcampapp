import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentCategoryProvider = StateProvider<ArticleCategory?>(
  (ref) => null,
);

/// The [ArticleCategory] consists of the categories of headlines
/// that can be got from NewsAPI
enum ArticleCategory {
  business,
  entertainment,
  general,
  health,
  science,
  sports,
  technology,
}