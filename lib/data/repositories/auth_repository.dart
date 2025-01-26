import 'package:firebase_auth/firebase_auth.dart';
import 'package:kitobix/data/models/universal_data/universal_data.dart';

class AuthRepository {
  Future<UniversalData> signUpUser({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return UniversalData(data: userCredential);
    } on FirebaseException catch (e) {
      return UniversalData(error: e.message ?? '');
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Future<UniversalData> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential =
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return UniversalData(data: userCredential);
    } on FirebaseAuthException catch (e) {
      return UniversalData(error: e.message ?? "");
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Stream<User?> listenAuthState() => FirebaseAuth.instance.authStateChanges();
}
