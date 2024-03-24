import 'package:flutter/material.dart';
import 'package:my_test_app/modules/user_password.dart';

class AddPasswordAccountDialog extends StatelessWidget {
  AddPasswordAccountDialog({
    required this.altFunction,
    required this.controller,
    required this.passwordText,
    required this.isNotPassGenScreen,
    super.key,
  });
  final void Function() altFunction;

  TextEditingController controller = TextEditingController();
  TextEditingController password = TextEditingController();

  final String passwordText;
  bool isNotPassGenScreen = true;
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
          isNotPassGenScreen
              ? TextField(
                  decoration: InputDecoration(
                    hintText: "Password",
                    labelText: "Password",
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
                  controller: password,
                )
              : const SizedBox(),
          !isNotPassGenScreen ? const SizedBox(height: 8.0) : const SizedBox(),
          !isNotPassGenScreen
              ? passwordText.isEmpty
                  ? const SizedBox()
                  : Text(
                      passwordText,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    )
              : const SizedBox()
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
                if (!isNotPassGenScreen) {
                  if (controller.text.trim().isNotEmpty) {
                    savedPasswords.add(UserPassword(
                      account: controller.text.trim(),
                      password: passwordText,
                    ));
                    print("Account : ${controller.text.trim()}");
                    print("Password: $passwordText");
                  } else
                    return;
                } else {
                  altFunction();
                }

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
