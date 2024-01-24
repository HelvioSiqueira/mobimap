import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobimap/app/utils/result_status.dart';

class AuthManager {
  FirebaseAuth firebaseInstance = FirebaseAuth.instance;
  late UserCredential userCredential;

  Future<Result<String, String>> doLogin(
      String email, String password) async {
    try {
      userCredential = await firebaseInstance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (!userCredential.user!.emailVerified) {
        firebaseInstance.signOut();
        return const Failure('no-verify');
      }

      return const Success('success');
    } on FirebaseAuthException catch (e) {
      print(e.code);
      return Failure(e.code);
    }
  }

  Future<Result<String, String>> doResetPassword(String email) async {
    try {
      await firebaseInstance.sendPasswordResetEmail(email: email);

      return const Success('success');
    } on FirebaseAuthException catch (e) {
      print(e.code);
      return Failure(e.code);
    }
  }

  Future<Result<String, String>> verifyEmail() async {
    try {
      await userCredential.user?.sendEmailVerification();
      return const Success('success');
    } on FirebaseAuthException catch (e) {
      print(e.code);
      return Failure(e.code);
    }
  }

  Future<Result<String, String>> doRegisterNewUser(
      String email, String password) async {
    try {
      userCredential = await firebaseInstance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await userCredential.user!.sendEmailVerification();

      return const Success('success');
    } on FirebaseAuthException catch (e) {
      print(e.code);
      return Failure(e.code);
    }
  }
}
