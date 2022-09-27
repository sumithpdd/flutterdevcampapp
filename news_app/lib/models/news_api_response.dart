import 'package:news_app/models/models.dart';

class NewsApiResponse {
  final String? status;
  final int? totalResults;
  final List<Article>? articles;

  NewsApiResponse({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory NewsApiResponse.fromJson(Map<String, dynamic> json) {
    late List<Article>? jsonArticles;

    if (json['articles'] != null) {
      jsonArticles = <Article>[];
      json['articles'].forEach((v) {
        jsonArticles?.add(Article.fromJson(v));
      });
    }

    return NewsApiResponse(
      status: json['status'],
      totalResults: json['totalResults'],
      articles: jsonArticles,
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data.addAll({'status': status});
    data.addAll({'totalResults': totalResults});
    articles != null ? data.addAll({'articles': articles!.map((v) => v.toJson()).toList()}) : data.addAll({'articles': null});

    return data;
  }
}
