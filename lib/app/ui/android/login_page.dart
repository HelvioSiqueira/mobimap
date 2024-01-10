import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobimap/app/ui/widgets/android/my_material_text_field.dart';

class LoginPage extends StatelessWidget {
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
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 210),
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
                            obscureText: true,),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              minimumSize: MaterialStateProperty.all<Size>(
                                  const Size(150, 50)),
                              elevation: MaterialStateProperty.all<double>(5)),
                          child: const Text('LOGAR'),
                        ),
                        TextButton(onPressed: (){}, child: const Text('Cadastrar'))
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
