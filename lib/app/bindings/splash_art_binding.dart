import 'package:get/get.dart';
import 'package:mobimap/app/controllers/login_controller.dart';
import 'package:mobimap/app/utils/auth_manager_impl.dart';

import '../controllers/home_controller.dart';

class SplashArtBinding extends Bindings{
  @override
  void dependencies() {
    BindingsBuilder(() {
      Get.lazyPut<HomeController>(() => HomeController());
    });

    BindingsBuilder(() {
      Get.lazyPut<LoginController>(() => LoginController(authManager: AuthManagerImpl()));
    });
  }
}