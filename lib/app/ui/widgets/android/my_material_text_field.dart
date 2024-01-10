import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyMaterialTextField extends StatefulWidget {
  MyMaterialTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.errorText,
    required this.maxLines,
    required this.maxLength,
  });

  MyMaterialTextField.toPassword({
    super.key,
    required this.controller,
    required this.hintText,
    required this.errorText,
    required this.maxLines,
    required this.maxLength,
    required this.obscureText,
  });

  final TextEditingController controller;
  final String hintText;
  final String? errorText;
  final int maxLines;
  final int? maxLength;
  bool obscureText = false;

  @override
  State<MyMaterialTextField> createState() => _MyMaterialTextFieldState();
}

class _MyMaterialTextFieldState extends State<MyMaterialTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscuringCharacter: '●',
      obscureText: widget.obscureText,
      maxLength: widget.maxLength,
      controller: widget.controller,
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
    );
  }
}
