import 'package:mobimap/app/data/providers/auth_manager_impl.dart';

import '../../utils/result_status.dart';

class RegisterRepository{
  RegisterRepository({required this.authManager});

  final AuthManagerImpl authManager;

  Future<Result<String, String>> doRegisterNewUser(String email, String password) async {
    return await authManager.doRegisterNewUser(email, password);
  }
}