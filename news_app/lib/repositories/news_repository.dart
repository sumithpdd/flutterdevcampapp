import 'dart:developer' as devtools;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/models/models.dart';
import 'package:news_app/news_api/news_api.dart';
import 'package:news_app/repositories/repositories.dart';

final newsRepositoryProvider = Provider<NewsRepository>((ref) {
  final dioHttpClient = ref.watch(dioProvider);

  return NewsRepository(dioHttpServiceClient: dioHttpClient);
});

class NewsRepository implements BaseRepository {
  final DioHttpService _dioHttpServiceClient;

  NewsRepository({
    required dioHttpServiceClient,
  }) : _dioHttpServiceClient = dioHttpServiceClient;

  // TODO (Joshua): Add Storage Service client
  static const String allArticlesEndpoint = '/everything';
  static const String headlinesEndpoint = '/top-headlines';

  @override
  Future<List<Article>> getAllArticles({String? category}) async {
    final NewsApiResponse? newsApiResponse;
    final queryParameters = <String, dynamic>{};
    // Get all articles in English from the last 7 days that include a randomized keyword from our category list
    queryParameters.addAll({'q': '"$category"'});
    queryParameters.addAll({'from': DateTime.now().subtract(const Duration(days: 7)).toIso8601String()});
    queryParameters.addAll({'language': 'en'});
    queryParameters.addAll({'sortBy': 'publishedAt'});

    try {
      final responseJson = await _dioHttpServiceClient.get(
        allArticlesEndpoint,
        queryParameters: queryParameters,
      );

      newsApiResponse = NewsApiResponse.fromJson(responseJson);
    } catch (e) {
      devtools.log('Exception: $e');

      rethrow;
    }

    return newsApiResponse.articles ?? [];
  }

  @override
  Future<List<Article>> getArticlesMatchingKeyword(String keyword) async {
    final NewsApiResponse? newsApiResponse;
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll({'q': keyword.split(' ').length > 1 ? '"$keyword"' : keyword});
    queryParameters.addAll({'language': 'en'});
    queryParameters.addAll({'sortBy': 'publishedAt'});
    devtools.log(queryParameters.toString());

    try {
      final responseJson = await _dioHttpServiceClient.get(allArticlesEndpoint, queryParameters: queryParameters);

      newsApiResponse = NewsApiResponse.fromJson(responseJson);
    } catch (e) {
      devtools.log('Exception: $e');

      rethrow;
    }

    return newsApiResponse.articles ?? [];
  }

  @override
  Future<List<Article>> getHeadlines({String? category}) async {
    final NewsApiResponse? newsApiResponse;
    final queryParameters = <String, dynamic>{};
    // Get all headlines from the UK
    // TODO (Joshua): Future addition, give user the option to set the default country for the headlines on the All
    //  Articles page
    queryParameters.addAll({'country': 'gb'});
    if (category != null) {
      queryParameters.addAll({'category': category});
    }

    try {
      final responseJson = await _dioHttpServiceClient.get(
        headlinesEndpoint,
        queryParameters: queryParameters,
      );

      newsApiResponse = NewsApiResponse.fromJson(responseJson);
    } catch (e) {
      devtools.log('Exception: $e');

      rethrow;
    }

    newsApiResponse.articles!.sort(); // Sort according to the date

    return newsApiResponse.articles ?? [];
  }

  @override
  Future<List<Article>> getHeadlinesFromCountry(String isoCode) async {
    final NewsApiResponse? newsApiResponse;
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll({'country': isoCode});

    try {
      final responseJson = await _dioHttpServiceClient.get(
        headlinesEndpoint,
        queryParameters: queryParameters,
      );

      newsApiResponse = NewsApiResponse.fromJson(responseJson);
    } catch (e) {
      devtools.log('Exception: $e');

      rethrow;
    }

    newsApiResponse.articles!.sort(); // Sort according to the date

    return newsApiResponse.articles ?? [];
  }
}
