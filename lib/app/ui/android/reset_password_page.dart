import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobimap/app/controllers/reset_password_controller.dart';

import '../widgets/android/my_material_text_field.dart';

class ResetPasswordPage extends GetView<ResetPasswordController> {
  ResetPasswordPage({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetX<ResetPasswordController>(builder: (controller) {
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
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 180),
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
                        //Title of page
                        Text(
                          "REDEFINIR SENHA".tr,
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
                            controller.errorMessage,
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
                          errorText: "Digite o email".tr,
                          maxLines: 1,
                          maxLength: null,
                        ),
                        const SizedBox(height: 10),

                        //Button to make register
                        ElevatedButton.icon(
                          label: Text("CONCLUIR".tr),
                          icon: iconButton,
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              await controller.resetPassword(_emailController.text);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size(180, 50),
                              padding: const EdgeInsets.all(16.0)),
                        ),
                        const SizedBox(height: 10),

                        //Message to show when password was reset
                        Visibility(
                          maintainSize: true,
                          maintainAnimation: true,
                          maintainState: true,
                          visible: controller.success.value,
                          child: Text(
                            controller.messageSuccess,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 11),
                          ),
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
