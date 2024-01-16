import 'package:get/get.dart';

import '../utils/auth_manager.dart';

class RegisterController extends GetxController{
  RegisterController({required this.authManager});

  final AuthManager authManager;
  RxBool loading = false.obs;
  RxBool error = false.obs;
}