import 'dart:collection' show MapView;

import 'package:flutter/foundation.dart' show immutable;
import 'package:news_app/storage/storage.dart';

@immutable
class UserInfoPayload extends MapView<String, String> {
  UserInfoPayload({
    required String userId,
    required String? displayName,
    required String? email,
    required String? photoUrl,
  }) : super(
          {
            FirebaseFieldName.userId: userId,
            FirebaseFieldName.displayName: displayName ?? '',
            FirebaseFieldName.email: email ?? '',
            FirebaseFieldName.photoUrl: photoUrl ?? '',
          },
        );
}
