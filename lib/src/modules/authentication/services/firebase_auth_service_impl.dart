import 'package:rareview_app/src/modules/authentication/services/interfaces/auth_service.dart';

class FirebaseAuthServiceImpl implements IAuthService {
  @override
  Future<void> createAccount({
    required String name,
    required String email,
    required String password,
  }) async {
    // TODO: implement createAccount
    throw UnimplementedError();
  }

  @override
  Future<void> login({
    required String email,
    required String password,
  }) async {
    // TODO: implement login
    throw UnimplementedError();
  }
}
