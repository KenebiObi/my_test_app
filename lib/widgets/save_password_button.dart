import 'package:flutter/material.dart';

class SavePasswordButton extends StatelessWidget {
  SavePasswordButton({required this.onTap, super.key});

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80.0,
        width: 80.0,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Icon(
          Icons.save,
          size: 40.0,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
