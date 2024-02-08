import 'package:get/get.dart';
import 'package:mobimap/app/controllers/login_controller.dart';

import '../data/providers/auth_manager_impl.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(authManager: AuthManagerImpl()),
    );
  }
}
