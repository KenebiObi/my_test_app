import 'package:flutter/material.dart';
import 'package:my_test_app/modules/user_password.dart';
import 'package:my_test_app/widgets/gen_pass_alert_dialog.dart';
import 'package:my_test_app/widgets/save_pass_bottom_sheet.dart';
import 'package:my_test_app/widgets/saved_password_tile.dart';

class SavePasswordScreen extends StatefulWidget {
  SavePasswordScreen([saveDetails]);

  @override
  State<SavePasswordScreen> createState() => _SavePasswordScreenState();
}

class _SavePasswordScreenState extends State<SavePasswordScreen> {
  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Saved Passwords",
                style: TextStyle(
                  fontSize: 27.0,
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  showModalBottomSheet(
                    backgroundColor: Colors.blue[50],
                    useSafeArea: true,
                    context: context,
                    builder: (ctx) => SavePassBottomSheetWidget(
                      accountController: _accountController,
                      passwordController: _passwordController,
                    ),
                  );
                },
                icon: const Icon(Icons.add),
                label: const Text("Add Password"),
              )
            ],
          ),
          const SizedBox(height: 20.0),
          SizedBox(
            height: deviceHeight - 275,
            child: savedPasswords.isEmpty
                ? const Center(
                    child: Text(
                      "No Saved Passwords Yet",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: savedPasswords.length,
                    itemBuilder: (ctx, index) {
                      return SavedPasswordTileWidget(
                        savedPasswords[index].account,
                        savedPasswords[index].password,
                      );
                    },
                  ),
          )
        ],
      ),
    );
  }
}
