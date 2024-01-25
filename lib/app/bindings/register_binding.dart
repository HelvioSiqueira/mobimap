import 'package:get/instance_manager.dart';
import 'package:mobimap/app/controllers/register_controller.dart';
import 'package:mobimap/app/utils/auth_manager_impl.dart';

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => RegisterController(
        authManager: AuthManagerImpl(),
      ),
    );
  }
}
