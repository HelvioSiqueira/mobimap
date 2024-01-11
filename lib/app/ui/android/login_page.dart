import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mobimap/app/ui/widgets/android/my_material_text_field.dart';

import '../../routes/app_routes.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    void wrongEmailMessage() {
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            backgroundColor: Colors.deepPurple,
            title: Center(
              child: Text(
                'Incorrect Email',
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      );
    }

    // wrong password message popup
    void wrongPasswordMessage() {
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            backgroundColor: Colors.deepPurple,
            title: Center(
              child: Text(
                'Incorrect Password',
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      );
    }

    void signInUser() async {

      showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      );

      try{
        var auth = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );

        var user = auth.user;

        print(user?.email);
        print(user?.displayName);

        Navigator.pop(context);
        Get.offAndToNamed(Routes.HOME);
      } on FirebaseAuthException catch(e) {

        print("Log");
        print(e.code);

        Navigator.pop(context);
        if (e.code == 'user-not-found') {
          // show error to user
          wrongEmailMessage();
        }

        else if (e.code == 'wrong-password') {
          // show error to user
          wrongPasswordMessage();
        } else {
          wrongPasswordMessage();
        }
      }
    }

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).colorScheme.primaryContainer,
      ),
    );

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
                        ElevatedButton(
                          onPressed: () async {
                             signInUser();
                          },
                          style: ButtonStyle(
                              minimumSize: MaterialStateProperty.all<Size>(
                                  const Size(150, 50)),
                              elevation: MaterialStateProperty.all<double>(5)),
                          child: const Text('LOGAR'),
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
  }
}
