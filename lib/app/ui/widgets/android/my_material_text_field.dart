import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyMaterialTextField extends StatefulWidget {
  MyMaterialTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.errorText,
      required this.maxLines,
      required this.maxLength,
      this.onErrorInput,
      this.hasError = false});

  final TextEditingController controller;
  final String hintText;
  final String? errorText;
  final int maxLines;
  final int? maxLength;
  final bool hasError;

  void Function()? onErrorInput = () {};

  @override
  State<MyMaterialTextField> createState() => _MyMaterialTextFieldState();
}

class _MyMaterialTextFieldState extends State<MyMaterialTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: widget.maxLength,
      controller: widget.controller,
      onChanged: (text) {
        if (widget.onErrorInput != null) {
          widget.onErrorInput!();
        }
      },
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
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              width: 2.0,
              color: widget.hasError
                  ? Theme.of(context).colorScheme.error
                  : Theme.of(context).colorScheme.onSurfaceVariant),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        border: OutlineInputBorder(
          borderSide: BorderSide(
              width: 2.0,
              color: widget.hasError
                  ? Theme.of(context).colorScheme.error
                  : Theme.of(context).colorScheme.tertiary),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        labelText: widget.hintText.tr,
      ),
    );
  }
}
