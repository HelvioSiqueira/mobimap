import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';

class VerifyEmailPage extends StatelessWidget {
  const VerifyEmailPage({super.key});

  @override
  Widget build(BuildContext context) {

    var createdEmail = Get.arguments as List<String>;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      appBar: AppBar(
        forceMaterialTransparency: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            height: 200,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
                borderRadius: BorderRadius.circular(50)),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      "Foi enviado um email para ${createdEmail.first} para concluir o cadastro. Após isso você poderá logar."
                          .tr,
                      textAlign: TextAlign.center),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () {
                        Get.offAndToNamed(Routes.LOGIN);
                      },
                      child: const Text("OK"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
