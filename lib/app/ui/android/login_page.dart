import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mobimap/app/controllers/login_controller.dart';
import 'package:mobimap/app/ui/widgets/android/my_material_text_field.dart';

import '../../routes/app_routes.dart';

class LoginPage extends GetView<LoginController> {
  LoginPage({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).colorScheme.primary,
      ),
    );

    onErrorInputs() {
      controller.error.value = false;
    }

    return GetX<LoginController>(builder: (controller) {
      void signInUser() async {
        if(await controller.doLogin(_emailController.text, _passwordController.text)){
          Get.offAndToNamed(Routes.HOME, arguments: [controller.authManager]);
        }
      }

      Widget iconButton = const Icon(Icons.login);

      if (controller.loading.isTrue) {
        iconButton = const SizedBox(
          height: 24,
          width: 24,
          child: CircularProgressIndicator(),
        );
      } else if (controller.error.isTrue) {
        iconButton = Icon(
          Icons.close,
          color: Theme.of(context).colorScheme.error,
        );
      }

      if(controller.needVerifyUser.value){
        //LÓGICA
      }

      return Scaffold(
        body: Form(
          key: _formKey,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.97,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Theme.of(context).colorScheme.primary,
                        Theme.of(context).colorScheme.tertiary
                      ]),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 140),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Text(
                              'LOGIN'.tr,
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Theme.of(context).colorScheme.primary),
                            ),
                          ),
                          Visibility(
                            maintainSize: true,
                            maintainAnimation: true,
                            maintainState: true,
                            visible: controller.error.value,
                            child: Text(
                              "Não foi possivel realizar o login, verifique seu email e senha e tente novamente.".tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 11,
                                  color: Theme.of(context).colorScheme.error),
                            ),
                          ),
                          const SizedBox(height: 10),
                          MyMaterialTextField(
                            controller: _emailController,
                            hintText: "Email".tr,
                            errorText: "Digite seu email".tr,
                            maxLines: 1,
                            maxLength: null,
                            onErrorInput: onErrorInputs,
                            hasError: controller.error.value,
                          ),
                          const SizedBox(height: 20),
                          MyMaterialTextField.toPassword(
                            controller: _passwordController,
                            hintText: "Password".tr,
                            errorText: "Digite a sua senha".tr,
                            maxLines: 1,
                            maxLength: null,
                            obscureText: true,
                            onErrorInput: onErrorInputs,
                            hasError: controller.error.value,
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton.icon(
                            label: Text("LOGAR".tr),
                            icon: iconButton,
                            onPressed: controller.loading.isTrue
                                ? null
                                : () async {
                                    signInUser();
                                  },
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(180, 50),
                                padding: const EdgeInsets.all(16.0)),
                          ),
                          TextButton(
                              onPressed: () {
                                Get.toNamed(Routes.REGISTER);
                              }, child: Text('Cadastrar'.tr)),
                          TextButton(onPressed: (){
                          }, child: Text('Esqueci minha senha'.tr))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
