import 'package:get/get.dart';
import 'package:mobimap/app/data/repository/reset_password_repository.dart';

import '../utils/errors/errors_reset_password.dart';
import '../utils/result_status.dart';

class ResetPasswordController extends GetxController {
  ResetPasswordController({required this.resetPasswordRepository});

  final ResetPasswordRepository resetPasswordRepository;
  RxBool loading = false.obs;
  RxBool error = false.obs;
  String errorMessage = "";

  Future<bool> resetPassword(String email) async {
    loading(true);
    var result = await resetPasswordRepository.doResetPassword(email);
    loading(false);

    switch (result) {
      case Success<String, String>():
        return true;
      case Failure<String, String>(exception: String exception):
        _handleResetPasswordTypeException(exception);
        error.value = true;
        return false;
    }
  }

  _handleResetPasswordTypeException(String exception) {
    switch (exception) {
      case ErrorsResetPassword.authUserNotFound:
        errorMessage = "Usuario não encontrado".tr;
        break;
      case ErrorsResetPassword.authInvalidEmail:
        errorMessage = "Email inválido".tr;
        break;
      default:
        errorMessage = "Não foi possivel resetar a sua senha,"
                " tente novamente mais tarde."
            .tr;
        break;
    }
  }
}
