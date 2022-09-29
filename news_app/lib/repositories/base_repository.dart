import 'package:news_app/models/models.dart';

/// [BaseRepository] interface
abstract class BaseRepository {
  Future<List<Article>> getAllArticles();
  Future<List<Article>> getArticlesMatchingKeyword(String keyword);
  Future<List<Article>> getHeadlines();
  Future<List<Article>> getHeadlinesFromCountry(String languageCode);
}
