import 'package:flutter/foundation.dart' show describeEnum;
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

extension SelectedArticleCategory on ArticleCategory {
  String get name => describeEnum(this);
}