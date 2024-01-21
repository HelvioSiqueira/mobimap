import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobimap/app/controllers/register_controller.dart';
import 'package:mobimap/app/ui/widgets/android/my_material_text_field.dart';

import '../widgets/android/my_material_text_field_password.dart';

class RegisterPage extends GetView<RegisterController> {
  RegisterPage({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstPasswordController =
      TextEditingController();
  final TextEditingController _secondPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    onErrorInputs() {
      controller.error.value = false;
      controller.errorMessage.value = "";
    }

    return GetX<RegisterController>(builder: (controller) {
      Widget iconButton = const Icon(Icons.check);

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

      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        appBar: AppBar(
          forceMaterialTransparency: true,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back)),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 120),
              child: Form(
                key: _formKey,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onPrimary,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'CADASTRO'.tr,
                          style: TextStyle(
                              fontSize: 30,
                              color: Theme.of(context).colorScheme.primary),
                        ),

                        //Message to show when has error
                        Visibility(
                          maintainSize: true,
                          maintainAnimation: true,
                          maintainState: true,
                          visible: controller.error.value,
                          child: Text(
                            controller.errorMessage.value,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 11,
                                color: Theme.of(context).colorScheme.error),
                          ),
                        ),
                        const SizedBox(height: 10),

                        //TextField to email
                        MyMaterialTextField(
                          controller: _emailController,
                          hintText: "Email",
                          errorText: "Digite seu email".tr,
                          maxLines: 1,
                          maxLength: null,
                        ),
                        const SizedBox(height: 10),

                        //TextField to first password
                        MyMaterialTextFieldPassword(
                          controller: _firstPasswordController,
                          hintText: "Senha",
                          onErrorInput: onErrorInputs,
                          errorText: "",
                          maxLines: 1,
                          maxLength: null,
                          strengthPassword: true,
                          onStrengthPassword: controller.onStrengthPassword,
                        ),
                        const SizedBox(height: 15),

                        //TextField to second password
                        MyMaterialTextFieldPassword(
                          controller: _secondPasswordController,
                          hintText: "Confirme a senha",
                          errorText: "Digite a sua senha".tr,
                          onErrorInput: onErrorInputs,
                          maxLines: 1,
                          maxLength: null,
                        ),
                        const SizedBox(height: 30),

                        //Button to make register
                        ElevatedButton.icon(
                          label: Text("CONCLUIR".tr),
                          icon: iconButton,
                          onPressed: controller.activateButton.value
                              ? () async {
                                  if (_firstPasswordController.text ==
                                      _secondPasswordController.text) {
                                    if (_formKey.currentState!.validate()) {
                                      if (await controller.registerNewUser(
                                        _emailController.text,
                                        _firstPasswordController.text,
                                      )) {
                                        print("Cheque seu email e faça a verificação");
                                      }
                                    }
                                  } else {
                                    controller.error.value = true;
                                    controller.errorMessage.value =
                                        "As senhas são diferentes".tr;
                                  }
                                }
                              : null,
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size(180, 50),
                              padding: const EdgeInsets.all(16.0)),
                        ),
                      ],
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
