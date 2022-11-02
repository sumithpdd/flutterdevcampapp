import 'package:flutter/foundation.dart' show immutable;

@immutable
class FirebaseCollectionName {
  static const users = 'users';
  static const articles = 'articles';
  static const sources = 'sources';
  const FirebaseCollectionName._();
}