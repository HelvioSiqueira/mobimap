
import 'package:get/get.dart';

import '../utils/auth_manager.dart';

class RegisterController extends GetxController{
  RegisterController({required this.authManager});

  final AuthManager authManager;
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
}