import 'package:flutter/foundation.dart' show immutable;

@immutable
class FirebaseFieldName {
  static const userId = 'uid';
  static const displayName = 'display_name';
  static const email = 'email';
  static const photoUrl = 'photo_url';
  static const createdAt = 'created_at';
  static const articleId = 'article_id';
  static const source = 'source';
  static const author = 'author';
  static const title = 'title';
  static const description = 'description';
  static const url = 'url';
  static const urlToImage = 'image_url';
  static const publishedAt = 'published_at';
  static const content = 'content';
  const FirebaseFieldName._();
}