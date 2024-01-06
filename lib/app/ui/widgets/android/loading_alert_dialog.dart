import 'package:flutter/material.dart';

class LoadingAlertDialog extends StatelessWidget {
  const LoadingAlertDialog({
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
