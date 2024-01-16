import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobimap/app/utils/result_status.dart';

class AuthManager {
  FirebaseAuth firebaseInstance = FirebaseAuth.instance;
  late UserCredential userCredential;

  Future<Result<String, Exception>> doLogin(
      String email, String password) async {
    try {
      userCredential = await firebaseInstance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if(!userCredential.user!.emailVerified){
        firebaseInstance.signOut();
        return const NoVerifyUser('verify');
      }

      return const Success('success');
    } on FirebaseAuthException catch (e) {
      print(e.code);
      return Failure(e);
    }
  }

  Future<Result<String, Exception>> doResetPassword(String email) async {
    try {
      await firebaseInstance.sendPasswordResetEmail(email: email);

      return const Success('success');
    } on FirebaseAuthException catch (e) {
      print(e.code);
      return Failure(e);
    }
  }

  Future<Result<String, Exception>> verifyEmail() async {
    try {
      await userCredential.user?.sendEmailVerification();
      return const Success('success');
    } on FirebaseAuthException catch (e) {
      print(e.code);
      return Failure(e);
    }
  }
}
