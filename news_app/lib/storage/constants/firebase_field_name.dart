import 'package:flutter/foundation.dart' show immutable;

@immutable
class FirebaseFieldName {
  static const userId = 'uid';
  static const displayName = 'display_name';
  static const email = 'email';
  static const photoUrl = 'photo_url';
  const FirebaseFieldName._();
}