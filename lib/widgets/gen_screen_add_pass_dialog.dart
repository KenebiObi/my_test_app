import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:EPASS/backend/database_service.dart';
import 'package:EPASS/backend/user_details.dart';

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
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return AlertDialog(
      title: const Text("Save Password"),
      content: SizedBox(
        height: MediaQuery.of(context).size.height * 0.11,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Center(
                child: TextField(
                  textInputAction: TextInputAction.next,
                  style: const TextStyle(
                    fontFamily: "Karla",
                    fontSize: 18.0,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    labelText: "Name of account",
                    labelStyle: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                      fontSize: 18.0,
                    ),
                    border: InputBorder.none,
                  ),
                  controller: widget.controller,
                ),
              ),
            ),
            const SizedBox(height: 15.0),

            widget.passwordText.isEmpty
                ? const SizedBox()
                : Text(
                    widget.passwordText,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: isDarkMode
                          ? Colors.white
                          : Theme.of(context).colorScheme.primary,
                    ),
                  ),
            // Spacer(),
          ],
        ),
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
                        createdOn: Timestamp.now());
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
