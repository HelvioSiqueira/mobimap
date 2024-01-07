import 'package:flutter/material.dart';

class MyLoadingAlertDialog extends StatelessWidget {
  const MyLoadingAlertDialog({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: const SizedBox(
          height: 50,
          width: 50,
          child: Center(child: CircularProgressIndicator())),
    );
  }
}
