import 'package:flutter/material.dart';

class AuthSpinerDialog extends StatelessWidget {
  const AuthSpinerDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      content: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
