import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rareview_app/src/modules/authentication/services/fakes/fake_auth_service_impl.dart';
import 'package:rareview_app/src/modules/authentication/services/interfaces/auth_service.dart';
import 'package:rareview_app/src/shared/models/failure.dart';

enum AuthState {
  initial,
  loading,
  loaded,
}

final authProvider = StateNotifierProvider<AuthController, AuthState>((ref) {
  return AuthController(AuthState.initial, authService: FakeAuthServiceImpl());
});

class AuthController extends StateNotifier<AuthState> {
  AuthController(AuthState state, {required this.authService}) : super(state);

  final IAuthService authService;

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    try {
      state = AuthState.loading;
      await authService.login(email: email, password: password);
      state = AuthState.loaded;
    } on Failure {
      state = AuthState.loaded;
      rethrow;
    }
  }

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      state = AuthState.loading;
      await authService.createAccount(
        name: name,
        email: email,
        password: password,
      );
      state = AuthState.loaded;
    } on Failure {
      state = AuthState.loaded;
      rethrow;
    }
  }
}
