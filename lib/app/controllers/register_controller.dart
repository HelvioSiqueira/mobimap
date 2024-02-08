import 'package:get/get.dart';
import 'package:mobimap/app/data/repository/register_repository.dart';
import 'package:mobimap/app/utils/result_status.dart';

import '../utils/errors/errors_create_user.dart';

class RegisterController extends GetxController {
  RegisterController({required this.registerRepository});

  final RegisterRepository registerRepository;
  RxBool loading = false.obs;
  RxBool error = false.obs;
  RxString errorMessage = "".obs;

  RxBool activateButton = false.obs;

  void onStrengthPassword(
    bool isLettersChecked,
    bool isNumbersChecked,
    bool isSpecialChecked,
  ) {
    if (isLettersChecked && isNumbersChecked && isSpecialChecked) {
      activateButton(true);
    } else {
      activateButton(false);
    }
  }

  Future<bool> registerNewUser(String email, String password) async {
    loading(true);

    var result = await registerRepository.doRegisterNewUser(email, password);

    loading(false);

    switch (result) {
      case Success<String, String>():
        return true;
      case Failure<String, String>(exception: String exception):
        _handleTypeException(exception);
        return false;
    }
  }

  _handleTypeException(String exception) {
    switch (exception) {
      case ErrorsCreateUser.emailAlreadyInUse:
        errorMessage.value = "Email já está em uso".tr;
        break;
      case ErrorsCreateUser.invalidEmail:
        errorMessage.value = "Email invalido".tr;
        break;
      case ErrorsCreateUser.operationNotAllowed:
        errorMessage.value = "Operação não permitida".tr;
        break;
      case ErrorsCreateUser.weakPassword:
        errorMessage.value = "Senha fraca".tr;
        break;
    }
  }
}
