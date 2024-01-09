import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyMaterialTextField extends StatefulWidget {
  const MyMaterialTextField({
    super.key,
    required this.nameAPController,
    required this.formKey,
    required this.hintText,
    required this.errorText,
    required this.maxLines,
  });

  final TextEditingController nameAPController;
  final GlobalKey<FormState> formKey;
  final String hintText;
  final String? errorText;
  final int maxLines;

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
          onChanged: (text) {},
          maxLines: widget.maxLines,
          validator: widget.errorText != null
              ? (value) {
                  if (value!.isEmpty) {
                    return widget.errorText?.tr;
                  }
                  return null;
                }
              : null,
          decoration: InputDecoration(
            alignLabelWithHint: false,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            labelText: widget.hintText.tr,
          ),
        ));
  }
}
