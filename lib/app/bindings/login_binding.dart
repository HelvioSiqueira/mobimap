import 'package:get/get.dart';
import 'package:mobimap/app/controllers/login_controller.dart';
import 'package:mobimap/app/data/repository/login_repository.dart';

import '../data/providers/auth_manager_impl.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(
        loginRepository: LoginRepository(
          authManager: AuthManagerImpl(),
        ),
      ),
    );
  }
}
