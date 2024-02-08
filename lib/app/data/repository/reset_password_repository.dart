import 'package:mobimap/app/data/providers/auth_manager_impl.dart';

import '../../utils/result_status.dart';

class ResetPasswordRepository{
  ResetPasswordRepository({required this.authManager});

  final AuthManagerImpl authManager;

  Future<Result<String, String>> doResetPassword(String email) async {
    return await authManager.doResetPassword(email);
  }
}