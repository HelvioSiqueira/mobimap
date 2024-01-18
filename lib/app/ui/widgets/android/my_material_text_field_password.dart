import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobimap/app/ui/widgets/android/strength_password.dart';
import 'package:mobimap/app/utils/remove_spaces.dart';

class MyMaterialTextFieldPassword extends StatefulWidget {
  MyMaterialTextFieldPassword({
    super.key,
    required this.controller,
    required this.hintText,
    required this.errorText,
    required this.maxLines,
    required this.maxLength,
    this.onErrorInput,
    this.hasError = false,
    this.strengthPassword = false,
  });

  final TextEditingController controller;
  final String hintText;
  final String? errorText;
  final int maxLines;
  final int? maxLength;
  bool hasError;
  bool strengthPassword;

  void Function()? onErrorInput = () {};

  @override
  State<MyMaterialTextFieldPassword> createState() =>
      _MyMaterialTextFieldPasswordState();
}

class _MyMaterialTextFieldPasswordState
    extends State<MyMaterialTextFieldPassword> {
  var obscureText = true;
  IconButton? suffixIcon;

  var isLettersChecked = false;
  var isNumbersChecked = false;
  var isSpecialChecked = false;

  @override
  Widget build(BuildContext context) {
    suffixIcon = IconButton(
        onPressed: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
        icon: obscureText
            ? const Icon(Icons.visibility)
            : const Icon(Icons.visibility_off));

    return Column(
      children: [
        TextFormField(
          obscuringCharacter: '●',
          obscureText: obscureText,
          maxLength: widget.maxLength,
          controller: widget.controller,
          onChanged: (text) {
            if (widget.onErrorInput != null) {
              widget.onErrorInput!();
            }

            if (text.contains(RegExp(r'[a-z]', caseSensitive: false))) {
              setState(() {
                isLettersChecked = true;
              });
            } else {
              setState(() {
                isLettersChecked = false;
              });
            }

            if (text.contains(RegExp(r'\d'))) {
              setState(() {
                isNumbersChecked = true;
              });
            } else {
              setState(() {
                isNumbersChecked = false;
              });
            }

            if (text.contains(RegExp(
                r'[\^$*.\[\]{}()?\-"!@#%&/\,><:;_~`+=' // <-- Notice the escaped symbols
                "'" // <-- ' is added to the expression
                ']'))) {
              setState(() {
                isSpecialChecked = true;
              });
            } else {
              setState(() {
                isSpecialChecked = false;
              });
            }

            widget.controller.removeSpaces();
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
            suffixIcon: suffixIcon,
          ),
        ),
        Visibility(
            visible: widget.strengthPassword,
            child: StrengthPassword(
              isLettersChecked: isLettersChecked,
              isNumbersChecked: isNumbersChecked,
              isSpecialChecked: isSpecialChecked,
            )),
      ],
    );
  }
}
