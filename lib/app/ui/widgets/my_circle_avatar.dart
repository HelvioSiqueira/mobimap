import 'package:flutter/material.dart';

class MyCircleAvatar extends StatelessWidget {
  const MyCircleAvatar({
    super.key,
    required this.onPressed,
    required this.childCircleAvatar,
  });

  final void Function() onPressed;
  final Widget childCircleAvatar;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 30,
      right: 5,
      child: IconButton(
          onPressed: onPressed,
          icon: Container(
            decoration: BoxDecoration(
                border: Border.all(
                    color: Theme.of(context).colorScheme.primary, width: 3),
                borderRadius: const BorderRadius.all(Radius.circular(30))),
            child: CircleAvatar(
              radius: 25,
              child: childCircleAvatar,
            ),
          )),
    );
  }
}
