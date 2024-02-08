import 'package:mobimap/app/data/providers/auth_manager_impl.dart';

import '../../utils/result_status.dart';

class LoginRepository {
  LoginRepository({required this.authManager});

  final AuthManagerImpl authManager;

  Future<Result<String, String>> doLogin(String email, String password) async {
    return await authManager.doLogin(email, password);
  }
}
