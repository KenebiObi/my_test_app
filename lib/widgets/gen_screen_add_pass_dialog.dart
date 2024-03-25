import 'package:flutter/material.dart';
import 'package:my_test_app/modules/user_password.dart';

class GenScreenAddPassDialog extends StatelessWidget {
  GenScreenAddPassDialog({
    required this.controller,
    required this.passwordText,
    super.key,
  });

  TextEditingController controller = TextEditingController();
  TextEditingController password = TextEditingController();

  final String passwordText;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Save Password"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: "Name of account",
              labelText: "Name of account",
              labelStyle: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2.0,
                  color: Theme.of(context).colorScheme.primary,
                ),
                borderRadius: BorderRadius.circular(15.0),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            controller: controller,
          ),
          const SizedBox(height: 15.0),

          passwordText.isEmpty
              ? const SizedBox()
              : Text(
                  passwordText,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
          // Spacer(),
        ],
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                "Cancel",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (controller.text.trim().isNotEmpty) {
                  savedPasswords.add(UserPassword(
                    account: controller.text.trim(),
                    password: passwordText,
                  ));
                  print("Account : ${controller.text.trim()}");
                  print("Password: $passwordText");
                } else
                  return;

                Navigator.pop(context);
              },
              child: const Text(
                "Save",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ],
        )
      ],
    );
  }
}
