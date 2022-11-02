import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:news_app/app_constants/app_constants.dart';
import 'package:news_app/storage/constants/constants.dart';
import 'package:news_app/storage/models/models.dart';

@immutable
class UserInfoStorage {
  const UserInfoStorage();

  Future<bool> saveUserInfo({
    required String userId,
    required String? displayName,
    required String? email,
    required String? photoUrl,
  }) async {
    try {
      final userInfo = await FirebaseFirestore.instance
          .collection(
        FirebaseCollectionName.users,
      )
          .where(
        FirebaseFieldName.userId,
        isEqualTo: userId,
      )
          .limit(1)
          .get();

      if (userInfo.docs.isNotEmpty) {
        // We already have this user's info
        await userInfo.docs.first.reference.update({
          FirebaseFieldName.displayName: displayName,
          FirebaseFieldName.email: email,
          FirebaseFieldName.photoUrl: photoUrl,
        });
        return true;
      }

      // we don't have this user's info so we create a new user
      final payload = UserInfoPayload(
        userId: userId,
        displayName: displayName,
        email: email,
        photoUrl: photoUrl,
      );
      await FirebaseFirestore.instance
          .collection(
        FirebaseCollectionName.users,
      )
          .add(
        payload,
      );
      return true;
    } catch (e) {
      e.log();
      return false;
    }
  }
}
