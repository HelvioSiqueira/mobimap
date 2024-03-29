import '../../utils/result_status.dart';

abstract class AuthManager {
  Future<Result<String, String>> doLogin(String email, String password);

  Future<Result<String, String>> doResetPassword(String email);

  Future<Result<String, String>> doRegisterNewUser(
      String email, String password);
}
