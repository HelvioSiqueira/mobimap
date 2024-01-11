import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobimap/app/utils/result_status.dart';

class AuthManager {
  FirebaseAuth firebaseInstance = FirebaseAuth.instance;
  late UserCredential userCredential;

  Future<Result<String, Exception>> doLogin(String email, String password) async {
    try {

      userCredential = await firebaseInstance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return const Success('success');
    } on FirebaseAuthException catch (e) {
      print(e.code);
      return Failure(e);
    }
  }
}
