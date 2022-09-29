import 'dart:developer';

import 'package:news_app/models/models.dart';
import 'package:news_app/repositories/repositories.dart';
import 'package:news_app/services/services.dart';

class NewsRepository implements BaseRepository {
  final DioHttpService dioHttpServiceClient;

  NewsRepository({
    DioHttpService? dioHttpServiceOverride,
  }) : dioHttpServiceClient = dioHttpServiceOverride ?? DioHttpService();

  // TODO (Joshua): Add Storage Service client
  static const String allArticlesEndpoint = '/everything';
  static const String headlinesEndpoint = '/top-headlines';

  @override
  Future<List<Article>> getAllArticles() async {
    final NewsApiResponse? newsApiResponse;

    try {
      final responseJson = await dioHttpServiceClient.get(allArticlesEndpoint);

      newsApiResponse = NewsApiResponse.fromJson(responseJson);
    } catch (e) {
      log('Exception: $e');

      rethrow;
    }

    return newsApiResponse.articles ?? [];
  }

  @override
  Future<List<Article>> getArticlesMatchingKeyword(String keyword) {
    // TODO: implement getArticlesMatchingKeyword
    throw UnimplementedError();
  }

  @override
  Future<List<Article>> getHeadlines() {
    // TODO: implement getHeadlines
    throw UnimplementedError();
  }

  @override
  Future<List<Article>> getHeadlinesFromCountry(String languageCode) {
    // final headlinesFromSpecificCountryEndpoint = '$headlinesEndpoint/sources';

    return Future.delayed(const Duration(seconds: 2), () => []);
  }
}
