import 'package:get/get.dart';
import 'package:mobimap/app/utils/auth_manager.dart';
import 'package:mobimap/app/utils/errors/errors_login.dart';
import 'package:mobimap/app/utils/result_status.dart';

class LoginController extends GetxController {
  LoginController({required this.authManager});

  final AuthManager authManager;
  RxBool loading = false.obs;
  RxBool error = false.obs;
  RxBool needVerifyUser = false.obs;
  String errorMessage = "";

  Future<bool> doLogin(String email, String password) async {
    loading(true);

    var result = await authManager.doLogin(email, password);

    loading(false);

    switch (result) {
      case Success<String, String>():
        return true;
      case Failure<String, String>(exception: String exception):
        _handleTypeException(exception);
        error.value = true;
        return false;
    }
  }

  Future<bool> resetPassword(String email) async {
    loading(true);
    var result = await authManager.doResetPassword(email);
    loading(false);

    if (result is Failure) {
      error.value = true;
      return false;
    } else if (result is Success) {
      return true;
    } else {
      return false;
    }
  }

  _handleTypeException(String exception) {
    switch (exception) {
      case ErrorsLogin.noVerify:
        errorMessage =
            "Primeiro faça a verificação do seu email e tente novamente.".tr;
        break;

      case ErrorsLogin.userDisabled:
        errorMessage = "Usario foi desabilitado".tr;
        break;

      case ErrorsLogin.invalidEmail:
        errorMessage = "Email invaligo".tr;
        break;

      default:
        errorMessage =
            "Não foi possivel realizar o login, verifique seu email e senha e tente novamente."
                .tr;
    }
  }
}
