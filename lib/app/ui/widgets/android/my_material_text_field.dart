import 'package:flutter/material.dart';

class MyMaterialTextField extends StatelessWidget {
  const MyMaterialTextField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
  });

  final String hintText;
  final Icon prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      maxLines: 2,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        hintText: hintText,
      ),
    );
  }
}
