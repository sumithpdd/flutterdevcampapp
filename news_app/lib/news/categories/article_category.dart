import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentCategoryProvider = Provider<ArticleCategory?>(
  (ref) => null,
);

enum ArticleCategory {
  business,
  entertainment,
  general,
  health,
  science,
  sports,
  technology,
}
