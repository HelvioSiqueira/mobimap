import 'package:get/get.dart';
import 'package:mobimap/app/utils/auth_manager.dart';

class LoginController extends GetxController{
  LoginController({required this.authManager});

  final AuthManager authManager;
  RxBool loading = false.obs;

  doLogin(String email, String password) async {
    loading(true);

    await authManager.doLogin(email, password);

    loading(false);
  }

}