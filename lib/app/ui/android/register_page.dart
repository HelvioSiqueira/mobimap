import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobimap/app/controllers/register_controller.dart';
import 'package:mobimap/app/ui/widgets/android/my_material_text_field.dart';

class RegisterPage extends GetView<RegisterController> {
  RegisterPage({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstPasswordController =
      TextEditingController();
  final TextEditingController _secondPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetX<RegisterController>(builder: (controller) {
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

      return Scaffold(
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  MyMaterialTextField(
                    controller: _nameController,
                    hintText: "Nome",
                    errorText: "",
                    maxLines: 1,
                    maxLength: null,
                  ),
                  const SizedBox(height: 10),
                  MyMaterialTextField(
                    controller: _lastNameController,
                    hintText: "Sobrenome",
                    errorText: "",
                    maxLines: 1,
                    maxLength: null,
                  ),
                  const SizedBox(height: 10),
                  MyMaterialTextField(
                    controller: _emailController,
                    hintText: "Email",
                    errorText: "",
                    maxLines: 1,
                    maxLength: null,
                  ),
                  const SizedBox(height: 10),
                  MyMaterialTextField(
                    controller: _firstPasswordController,
                    hintText: "Senha",
                    errorText: "",
                    maxLines: 1,
                    maxLength: null,
                  ),
                  const SizedBox(height: 10),
                  MyMaterialTextField(
                    controller: _secondPasswordController,
                    hintText: "Confirme a senha",
                    errorText: "",
                    maxLines: 1,
                    maxLength: null,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
