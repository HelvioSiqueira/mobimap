import 'package:get/get.dart';
import 'package:mobimap/app/controllers/reset_password_controller.dart';

import '../data/providers/auth_manager_impl.dart';

class ResetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ResetPasswordController(authManager: AuthManagerImpl()));
  }

}