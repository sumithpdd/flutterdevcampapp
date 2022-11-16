import 'package:flutter/foundation.dart' show immutable;
import 'package:news_app/news/news.dart' show Source;
import 'package:news_app/storage/storage.dart';

@immutable
class SavedArticle {
  final String articleId;
  final String userId;
  final String createdAt;
  final Source? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  SavedArticle({
    required this.articleId,
    required Map<String, dynamic> json,
  })  : userId = json[FirebaseFieldName.userId],
        createdAt = json[FirebaseFieldName.createdAt],
        source = Source.fromJson(json[FirebaseFieldName.source]),
        author = json[FirebaseFieldName.author],
        title = json[FirebaseFieldName.title],
        description = json[FirebaseFieldName.description],
        url = json[FirebaseFieldName.url],
        urlToImage = json[FirebaseFieldName.urlToImage],
        publishedAt = json[FirebaseFieldName.publishedAt],
        content = json[FirebaseFieldName.content];
}
