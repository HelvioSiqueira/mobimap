import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobimap/app/controllers/register_controller.dart';
import 'package:mobimap/app/ui/widgets/android/my_material_text_field.dart';

import '../widgets/android/my_material_text_field_password.dart';
import '../widgets/android/strength_password.dart';

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
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimary,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Form(
                  key: _formKey,
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
                        const SizedBox(height: 40),
                        MyMaterialTextField(
                          controller: _emailController,
                          hintText: "Email",
                          errorText: "",
                          maxLines: 1,
                          maxLength: null,
                        ),
                        const SizedBox(height: 10),
                        MyMaterialTextFieldPassword(
                          controller: _firstPasswordController,
                          hintText: "Senha",
                          errorText: "",
                          maxLines: 1,
                          maxLength: null,
                          strengthPassword: true,
                        ),
                        const SizedBox(height: 15),
                        MyMaterialTextFieldPassword(
                          controller: _secondPasswordController,
                          hintText: "Confirme a senha",
                          errorText: "",
                          maxLines: 1,
                          maxLength: null,
                        ),
                        const SizedBox(height: 30),
                        ElevatedButton.icon(
                          label: Text("CONCLUIR".tr),
                          icon: iconButton,
                          onPressed: () {},
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
