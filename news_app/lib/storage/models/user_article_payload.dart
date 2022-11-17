import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart' show FieldValue;
import 'package:flutter/foundation.dart' show immutable;
import 'package:news_app/storage/storage.dart';

@immutable
class UserArticlePayload extends MapView<String, dynamic> {
  UserArticlePayload({
    required String userId,
    required Map<String, dynamic> source,
    required String author,
    required String title,
    required String description,
    required String url,
    required String urlToImage,
    required String publishedAt,
    required String content,
  }) : super({
          FirebaseFieldName.userId: userId,
          FirebaseFieldName.createdAt: FieldValue.serverTimestamp(),
          FirebaseFieldName.source: source,
          FirebaseFieldName.author: author,
          FirebaseFieldName.title: title,
          FirebaseFieldName.description: description,
          FirebaseFieldName.url: url,
          FirebaseFieldName.urlToImage: urlToImage,
          FirebaseFieldName.publishedAt: publishedAt,
          FirebaseFieldName.content: content,
        });
}
