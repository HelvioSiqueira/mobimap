import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDropdownMenu extends StatelessWidget {
  const MyDropdownMenu({super.key, required this.typesOfAccessibility});

  final List<String> typesOfAccessibility;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
        initialSelection: typesOfAccessibility.first,
        label: Text("Tipo".tr),
        dropdownMenuEntries: typesOfAccessibility
            .map((type) => DropdownMenuEntry(value: type, label: type))
            .toList());
  }
}
