import 'package:get/get.dart';
import 'package:mobimap/app/utils/auth_manager.dart';
import 'package:mobimap/app/utils/result_status.dart';

class LoginController extends GetxController{
  LoginController({required this.authManager});

  final AuthManager authManager;
  RxBool loading = false.obs;
  RxBool error = false.obs;

  doLogin(String email, String password) async {
    loading(true);

    var result = await authManager.doLogin(email, password);

    if(result is Failure){
      error.value = true;
    }

    loading(false);
  }

}