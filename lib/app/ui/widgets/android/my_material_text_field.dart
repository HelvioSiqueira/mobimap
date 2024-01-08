import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyMaterialTextField extends StatefulWidget {
  const MyMaterialTextField({
    super.key,
    required this.nameAPController,
    required this.formKey
  });

  final TextEditingController nameAPController;
  final GlobalKey<FormState> formKey;

  @override
  State<MyMaterialTextField> createState() => _MyMaterialTextFieldState();
}

class _MyMaterialTextFieldState extends State<MyMaterialTextField> {
  @override
  Widget build(BuildContext context) {
    return Form(
        key: widget.formKey,
        child: TextFormField(
      controller: widget.nameAPController,
      onChanged: (text){},
      validator: (value){
        if(value!.isEmpty){
          return "O ponto precisa ter um nome".tr;
        }
        return null;
      },
      decoration: const InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        hintText: "Nome do ponto",
      ),
    ));
  }
}
