import 'dart:developer';

import 'package:news_app/models/models.dart';
import 'package:news_app/repositories/repositories.dart';
import 'package:news_app/services/services.dart';

class NewsRepository implements BaseRepository {
  final DioHttpService _dioHttpServiceClient;

  NewsRepository({
    DioHttpService? dioHttpServiceOverride,
  }) : _dioHttpServiceClient = dioHttpServiceOverride ?? DioHttpService();

  // TODO (Joshua): Add Storage Service client
  static const String allArticlesEndpoint = '/everything';
  static const String headlinesEndpoint = '/top-headlines';

  @override
  Future<List<Article>> getAllArticles({String? keyword}) async {
    final NewsApiResponse? newsApiResponse;
    final queryParameters = <String, dynamic>{};
    // Get all articles from yesterday that include "global warming"
    queryParameters.addAll({'q': '"global warming"'});
    queryParameters.addAll({'from': DateTime.now().subtract(const Duration(days: 1)).toIso8601String()});
    queryParameters.addAll({'language': 'en'});

    try {
      final responseJson = await _dioHttpServiceClient.get(
        allArticlesEndpoint,
        queryParameters: queryParameters,
      );

      newsApiResponse = NewsApiResponse.fromJson(responseJson);
    } catch (e) {
      log('Exception: $e');

      rethrow;
    }

    return newsApiResponse.articles ?? [];
  }

  @override
  Future<List<Article>> getArticlesMatchingKeyword(String keyword) async {
    final NewsApiResponse? newsApiResponse;
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll({'q': keyword});

    try {
      final responseJson = await _dioHttpServiceClient.get(allArticlesEndpoint, queryParameters: queryParameters);

      newsApiResponse = NewsApiResponse.fromJson(responseJson);
    } catch (e) {
      log('Exception: $e');

      rethrow;
    }

    return newsApiResponse.articles ?? [];
  }

  @override
  Future<List<Article>> getHeadlines() async {
    final NewsApiResponse? newsApiResponse;

    try {
      final responseJson = await _dioHttpServiceClient.get(headlinesEndpoint);

      newsApiResponse = NewsApiResponse.fromJson(responseJson);
    } catch (e) {
      log('Exception: $e');

      rethrow;
    }

    return newsApiResponse.articles ?? [];
  }

  @override
  Future<List<Article>> getHeadlinesFromCountry(String languageCode) async {
    final NewsApiResponse? newsApiResponse;
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll({'country': languageCode});

    try {
      final responseJson = await _dioHttpServiceClient.get(
        headlinesEndpoint,
        queryParameters: queryParameters,
      );

      newsApiResponse = NewsApiResponse.fromJson(responseJson);
    } catch (e) {
      log('Exception: $e');

      rethrow;
    }

    return newsApiResponse.articles ?? [];
  }
}
