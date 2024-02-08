import 'package:get/get.dart';
import 'package:mobimap/app/controllers/login_controller.dart';
import 'package:mobimap/app/data/repository/login_repository.dart';

import '../controllers/home_controller.dart';
import '../data/providers/auth_manager_impl.dart';

class SplashArtBinding extends Bindings {
  @override
  void dependencies() {
    BindingsBuilder(() {
      Get.lazyPut<HomeController>(() => HomeController());
    });

    BindingsBuilder(() {
      Get.lazyPut<LoginController>(
        () => LoginController(
          loginRepository: LoginRepository(authManager: AuthManagerImpl()),
        ),
      );
    });
  }
}
