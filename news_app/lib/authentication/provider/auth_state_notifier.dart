import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/authentication/authentication.dart';

class AuthStateNotifier extends StateNotifier<AuthState> {
  final _authService = const AuthService();

  AuthStateNotifier() : super(const AuthState.unknown()) {
    if (_authService.isAlreadyLoggedIn) {
      state = AuthState(
        result: AuthResult.success,
        isLoading: false,
        user: _authService.currentUser,
      );
    }
  }

  Future<void> logOut() async {
    state = state.copiedWithIsLoading(true);
    await _authService.logOut();
    state = const AuthState.unknown();
  }

  Future<void> loginWithGoogle() async {
    state = state.copiedWithIsLoading(true);
    final result = await _authService.loginWithGoogle();
    final user = _authService.currentUser;
    if (result == AuthResult.success && user != null) {

    }
  }
}