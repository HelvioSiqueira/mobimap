import 'package:flutter/material.dart';

extension RemoveSpaces on TextEditingController {
  removeSpaces() {
    text = text.replaceAll(" ", "");
  }
}