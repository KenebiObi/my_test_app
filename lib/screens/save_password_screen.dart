import 'package:flutter/material.dart';
import 'package:my_test_app/modules/user_password.dart';
import 'package:my_test_app/widgets/saved_password_tile.dart';

class SavePasswordScreen extends StatelessWidget {
  SavePasswordScreen({
    super.key,
  });

  // final void Function() saveDetails;
  List<UserPassword> savedPasswords = [
    const UserPassword(account: "Google", password: "password"),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30.0),
          const Text(
            "Saved Passwords",
            style: TextStyle(
              fontSize: 30.0,
            ),
          ),
          const SizedBox(height: 30.0),
          ListView.builder(
            shrinkWrap: true,
            itemCount: savedPasswords.length,
            itemBuilder: (ctx, index) {
              return SavedPasswordTileWidget(
                savedPasswords[index].account,
                savedPasswords[index].password,
              );
            },
          )
        ],
      ),
    );
  }
}
