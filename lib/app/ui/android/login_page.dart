import 'package:firebase_auth/firebase_auth.dart';
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
        statusBarColor: Theme.of(context).colorScheme.primaryContainer,
      ),
    );

    return GetX<LoginController>(builder: (controller) {
      void signInUser() async {
        controller.doLogin(_emailController.text, _passwordController.text);
      }

      return Scaffold(
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: SafeArea(
              child: Container(
                height: MediaQuery.of(context).size.height,
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
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 150),
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
                            padding: const EdgeInsets.only(bottom: 50),
                            child: Text(
                              'LOGIN',
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Theme.of(context).colorScheme.primary),
                            ),
                          ),
                          MyMaterialTextField(
                              controller: _emailController,
                              hintText: "Email",
                              errorText: "Digite seu email",
                              maxLines: 1,
                              maxLength: null),
                          const SizedBox(height: 20),
                          MyMaterialTextField.toPassword(
                            controller: _passwordController,
                            hintText: "Password",
                            errorText: "Digite a sua senha",
                            maxLines: 1,
                            maxLength: null,
                            obscureText: true,
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton.icon(
                            label: const Text("LOGAR"),
                            icon: controller.loading.isTrue
                                ? Container(
                                    width: 24,
                                    height: 24,
                                    padding: const EdgeInsets.all(2.0),
                                    child: const CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 3,
                                    ),
                                  )
                                : const Icon(Icons.login),
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
                              onPressed: () {}, child: const Text('Cadastrar'))
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
