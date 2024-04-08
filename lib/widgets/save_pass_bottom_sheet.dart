import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_test_app/backend/database_service.dart';
import 'package:my_test_app/backend/user_details.dart';
import 'package:my_test_app/backend/user_password.dart';

class SavePassBottomSheetWidget extends StatefulWidget {
  const SavePassBottomSheetWidget({
    required this.accountController,
    required this.passwordController,
    super.key,
  });

  final TextEditingController accountController;
  final TextEditingController passwordController;

  @override
  State<SavePassBottomSheetWidget> createState() =>
      _SavePassBottomSheetWidgetState();
}

class _SavePassBottomSheetWidgetState extends State<SavePassBottomSheetWidget> {
  final DataBaseServices _databaseServices = DataBaseServices();

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
            controller: widget.accountController,
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
            controller: widget.passwordController,
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
                  if (widget.accountController.text.trim().isNotEmpty &&
                      widget.passwordController.text.trim().isNotEmpty) {
                    setState(() {
                      UserDetails userdetail = UserDetails(
                        account: widget.accountController.text.trim(),
                        password: widget.passwordController.text.trim(),
                        createdOn: Timestamp.now(),
                      );
                      _databaseServices.addUserDetails(userdetail);
                    });

                    // setState(() {
                    //   saveToUser({
                    //     'account': widget.accountController.text.trim(),
                    //     'password': widget.passwordController.text.trim(),
                    //   });
                    // });

                    // savedUserPasswordDetails.add({
                    //   'account': widget.accountController.text.trim(),
                    //   'password': widget.passwordController.text.trim(),
                    // });

                    print("Account : ${widget.accountController.text.trim()}");
                    print("Password: ${widget.passwordController.text.trim()}");
                  } else
                    return;
                  Navigator.pop(context);
                  widget.accountController.clear();
                  widget.passwordController.clear();
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
