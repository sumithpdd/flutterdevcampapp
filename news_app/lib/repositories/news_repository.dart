import 'package:news_app/models/models.dart';

/// [NewsRepository] interface
abstract class NewsRepository {
  // TODO (Joshua): Complete implementing NewsRepository
  Future<List<Article>> getAllArticles();
  Future<List<Article>> getArticlesMatchingKeyword(String keyword);
}
