import 'package:flutter/material.dart';
import 'package:my_test_app/modules/user_password.dart';

class SavePassBottomSheetWidget extends StatelessWidget {
  const SavePassBottomSheetWidget({
    required this.accountController,
    required this.passwordController,
    super.key,
  });

  final TextEditingController accountController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 30.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Add New Password",
            style: TextStyle(fontSize: 25.0),
          ),
          const SizedBox(height: 30.0),
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
            controller: accountController,
          ),
          const SizedBox(height: 15.0),
          TextField(
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
            controller: passwordController,
          ),
          const SizedBox(height: 8.0),
          passwordController.text.trim().isEmpty
              ? const SizedBox()
              : Text(
                  passwordController.text.trim(),
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
          const SizedBox(height: 15.0),
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
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(100.0, 50.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onPressed: () {
                  if (accountController.text.trim().isNotEmpty &&
                      passwordController.text.trim().isNotEmpty) {
                    savedPasswords.add(
                      UserPassword(
                        account: accountController.text.trim(),
                        password: passwordController.text.trim(),
                      ),
                    );
                    print("Account : ${accountController.text.trim()}");
                    print("Password: ${passwordController.text.trim()}");
                  } else
                    return;
                  Navigator.pop(context);
                  accountController.clear();
                  passwordController.clear();
                },
                child: const Text(
                  "Save",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
