import 'package:news_app/models/models.dart';

/// [NewsRepository] interface
abstract class NewsRepository {
  Future<List<Article>> getAllArticles();
  Future<List<Article>> getArticlesMatchingKeyword(String keyword);
  Future<List<Article>> getHeadlines();
  Future<List<Article>> getHeadlinesFromCountry(String languageCode);
}
