import 'result_status.dart';

abstract class AuthManager {
  Future<Result<String, String>> doLogin(String login, String password);

  Future<Result<String, String>> doResetPassword(String email);

  Future<Result<String, String>> verifyEmail();

  Future<Result<String, String>> doRegisterNewUser(
      String email, String password);
}
