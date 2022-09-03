import 'package:rareview_app/src/modules/authentication/services/interfaces/auth_service.dart';
import 'package:rareview_app/src/shared/network/request_helper.dart';

class FakeAuthServiceImpl implements IAuthService {
  @override
  Future<void> createAccount({
    required String name,
    required String email,
    required String password,
  }) async {
    await Future.delayed(networkDelay);
  }

  @override
  Future<void> login({
    required String email,
    required String password,
  }) async {
    await Future.delayed(networkDelay);
  }
}
