import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:news_app/app_constants/app_constants.dart';
import 'package:news_app/news/news.dart' show Article;
import 'package:news_app/storage/storage.dart';

@immutable
class UserArticleStorage {
  const UserArticleStorage();

  Future<bool> saveArticle({
    required String userId,
    required Article article,
  }) async {
    try {
      final articlePayload = UserArticlePayload(
        userId: userId,
        source: article.source?.toJson() ?? OldAppStrings.missingSource,
        author: article.author ?? OldAppStrings.missingAuthor,
        title: article.title ?? OldAppStrings.missingTitle,
        description: article.description ?? OldAppStrings.missingDescription,
        url: article.url ?? OldAppStrings.missingUrl,
        urlToImage: article.urlToImage ?? OldAppStrings.missingImageUrl,
        publishedAt: article.publishedAt ?? OldAppStrings.missingDate,
        content: article.content ?? OldAppStrings.missingContent,
      );
      await FirebaseFirestore.instance
          .collection(
            FirebaseCollectionName.articles,
          )
          .add(articlePayload);
      return true;
    } catch (e) {
      e.log();
      return false;
    }
  }

  Future<bool> deleteArticle({
    required SavedArticle article,
  }) async {
    try {
      // TODO (Joshua): Implement Delete/Remove from saved articles
      return true;
    } catch (e) {
      e.log();
      return false;
    }
  }
}
