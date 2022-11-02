import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:news_app/authentication/models/auth_result.dart';

@immutable
class AuthState extends Equatable {
  final AuthResult? result;
  final bool isLoading;
  final User? user;

  const AuthState({
    required this.result,
    required this.isLoading,
    required this.user,
  });

  const AuthState.unknown()
      : result = null,
        isLoading = false,
        user = null;

  AuthState copiedWithIsLoading(bool isLoading) => AuthState(
        result: result,
        isLoading: isLoading,
        user: user,
      );

  @override
  List<Object?> get props => [result, isLoading, user];
}
