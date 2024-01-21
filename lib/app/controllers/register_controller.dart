
import 'package:get/get.dart';
import 'package:mobimap/app/utils/result_status.dart';

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

  Future<bool> registerNewUser(String email, String password) async {

    var result = await authManager.doRegisterNewUser(email, password);

    switch(result){

      case Success<String, String>():
        break;
      case Failure<String, String>(exception: String exception):
        switch(exception){
          case "":
            break;
        }
        break;
      case NoVerifyUser<String, String>():
       break;
    }

    return true;
  }
}