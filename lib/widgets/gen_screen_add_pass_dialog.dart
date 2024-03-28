import 'package:flutter/material.dart';
import 'package:my_test_app/modules/database_service.dart';
import 'package:my_test_app/modules/user_details.dart';
import 'package:my_test_app/modules/user_password.dart';

class GenScreenAddPassDialog extends StatefulWidget {
  GenScreenAddPassDialog({
    required this.controller,
    required this.passwordText,
    super.key,
  });

  TextEditingController controller = TextEditingController();
  final String passwordText;

  @override
  State<GenScreenAddPassDialog> createState() => _GenScreenAddPassDialogState();
}

class _GenScreenAddPassDialogState extends State<GenScreenAddPassDialog> {
  TextEditingController password = TextEditingController();
  final DataBaseServices _databaseServices = DataBaseServices();

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
            controller: widget.controller,
          ),
          const SizedBox(height: 15.0),

          widget.passwordText.isEmpty
              ? const SizedBox()
              : Text(
                  widget.passwordText,
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
                if (widget.controller.text.trim().isNotEmpty) {
                  setState(() {
                    UserDetails userdetail = UserDetails(
                      account: widget.controller.text.trim(),
                      password: widget.passwordText.trim(),
                    );
                    _databaseServices.addUserDetails(userdetail);
                  });
                  print("Account : ${widget.controller.text.trim()}");
                  print("Password: ${widget.passwordText}");
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
