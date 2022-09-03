import 'package:firebase_auth/firebase_auth.dart';
import 'package:rareview_app/src/modules/authentication/services/interfaces/auth_service.dart';
import 'package:rareview_app/src/shared/models/datastore.dart';
import 'package:rareview_app/src/shared/models/failure.dart';
import 'package:rareview_app/src/shared/models/user.dart';

class FirebaseAuthServiceImpl implements IAuthService {
  final _auth = FirebaseAuth.instance;

  @override
  Future<void> createAccount({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Failure('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw Failure('The account already exists for that email.');
      }
    }
  }

  @override
  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = userCredential.user;

      if (user != null) {
        DataStore.user = UserProfile(id: user.uid, name: 'name', email: email);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Failure('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw Failure('Wrong password provided for that user.');
      }
    }
  }
}
