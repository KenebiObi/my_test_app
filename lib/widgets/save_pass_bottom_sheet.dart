import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_test_app/backend/database_service.dart';
import 'package:my_test_app/backend/user_details.dart';

class Savmy_test_appBottomSheetWidget extends StatefulWidget {
  const Savmy_test_appBottomSheetWidget({
    required this.accountController,
    required this.passwordController,
    required this.executable,
    super.key,
  });

  final TextEditingController accountController;
  final TextEditingController passwordController;
  final void Function() executable;

  @override
  State<Savmy_test_appBottomSheetWidget> createState() =>
      _Savmy_test_appBottomSheetWidgetState();
}

class _Savmy_test_appBottomSheetWidgetState
    extends State<Savmy_test_appBottomSheetWidget> {
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
            style: TextStyle(
              fontSize: 25.0,
            ),
          ),
          const SizedBox(height: 30.0),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(20.0),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Center(
              child: TextField(
                textInputAction: TextInputAction.next,
                style: const TextStyle(
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
                controller: widget.accountController,
              ),
            ),
          ),
          const SizedBox(height: 15.0),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(20.0),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Center(
              child: TextField(
                textInputAction: TextInputAction.next,
                style: const TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(
                    color: Theme.of(context).colorScheme.tertiary,
                    fontSize: 18.0,
                  ),
                  border: InputBorder.none,
                ),
                controller: widget.passwordController,
              ),
            ),
          ),
          const SizedBox(height: 15.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  widget.executable();
                  Navigator.pop(context);
                },
                child: const Text(
                  "Cancel",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(100.0, 50.0),
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
                    print("Account : ${widget.accountController.text.trim()}");
                    print("Password: ${widget.passwordController.text.trim()}");
                  } else
                    return;
                  Navigator.pop(context);
                  widget.accountController.clear();
                  widget.passwordController.clear();
                  widget.executable();
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
