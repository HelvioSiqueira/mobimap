import 'package:flutter/material.dart';

class MyMaterialTextField extends StatefulWidget {
  const MyMaterialTextField({
    super.key,
    required this.nameAPController,
  });

  final TextEditingController nameAPController;

  @override
  State<MyMaterialTextField> createState() => _MyMaterialTextFieldState();
}

class _MyMaterialTextFieldState extends State<MyMaterialTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.nameAPController,
      onChanged: (text){},
      decoration: const InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        hintText: "Nome do ponto",
      ),
    );
  }
}
