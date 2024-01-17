import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StrengthPassword extends StatefulWidget {
  const StrengthPassword({
    super.key,
    required this.isLettersChecked,
    required this.isNumbersChecked,
    required this.isSpecialChecked,
  });

  final bool isLettersChecked;
  final bool isNumbersChecked;
  final bool isSpecialChecked;

  @override
  State<StrengthPassword> createState() => _StrengthPasswordState();
}

class _StrengthPasswordState extends State<StrengthPassword> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 7, left: 10),
      child: SizedBox(
        child: Row(
          children: [
            Icon(
              Icons.check,
              color: widget.isLettersChecked ? Colors.green : Colors.white,
            ),
            Text("Letras".tr),
            const SizedBox(width: 5),
            Icon(
              Icons.check,
              color: widget.isNumbersChecked ? Colors.green : Colors.white,
            ),
            Text("Numeros".tr),
            const SizedBox(width: 5),
            Icon(
              Icons.check,
              color: widget.isSpecialChecked ? Colors.green : Colors.white,
            ),
            Text("Especiais".tr),
          ],
        ),
      ),
    );
  }
}
