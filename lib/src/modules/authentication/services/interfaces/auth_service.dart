abstract class IAuthService {
  Future<void> createAccount({
    required String name,
    required String email,
    required String password,
  });
  Future<void> login({
    required String email,
    required String password,
  });
}
