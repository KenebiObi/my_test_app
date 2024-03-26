import 'package:flutter/material.dart';
import 'package:my_test_app/modules/user_password.dart';
import 'package:my_test_app/widgets/gen_screen_add_pass_dialog.dart';
import 'package:my_test_app/widgets/save_pass_bottom_sheet.dart';
import 'package:my_test_app/widgets/save_screen_add_pass_dialog.dart';
import 'package:my_test_app/widgets/saved_password_tile.dart';

class SavePasswordScreen extends StatefulWidget {
  SavePasswordScreen([saveDetails]);

  @override
  State<SavePasswordScreen> createState() => _SavePasswordScreenState();
}

class _SavePasswordScreenState extends State<SavePasswordScreen> {
  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _editAccountController = TextEditingController();
  final TextEditingController _editPasswordController = TextEditingController();

  void deletePassword(int index) {
    if (index >= 0 && index <= savedUserPasswordDetails.length) {
      Map<String, dynamic> removedItem = savedUserPasswordDetails[index];
      savedUserPasswordDetails.removeAt(index);
      print(savedUserPasswordDetails.length);
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 4),
          content: const Text(
            "Expenses deleted",
          ),
          action: SnackBarAction(
            label: "Undo",
            onPressed: () {
              setState(() {
                savedUserPasswordDetails.insert(index, removedItem);
              });
            },
          ),
          dismissDirection: DismissDirection.horizontal,
        ),
      );
    }
  }

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
                  fontSize: 23.0,
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
                  ).then((_) {
                    setState(() {});
                  });
                },
                icon: const Icon(Icons.add),
                label: const Text("Add Password"),
              )
            ],
          ),
          const SizedBox(height: 20.0),
          SizedBox(
            height: deviceHeight - 275,
            child: savedUserPasswordDetails.isEmpty
                ? const Center(
                    child: Text(
                      "No Saved Passwords Yet",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: savedUserPasswordDetails.length,
                    itemBuilder: (ctx, index) {
                      return Dismissible(
                        key: ValueKey(savedUserPasswordDetails[index]),
                        onDismissed: (direction) {
                          deletePassword(index);
                        },
                        child: SavedPasswordTileWidget(
                          altFunction: () {
                            showDialog(
                              context: context,
                              builder: (context) => SaveScreenAddPassDialog(
                                controller: _editAccountController,
                                password: _editPasswordController,
                                executable: () => setState(
                                  () {
                                    savedUserPasswordDetails[index]['account'] =
                                        _editAccountController.text.trim();
                                    savedUserPasswordDetails[index]
                                            ['password'] =
                                        _editPasswordController.text.trim();
                                  },
                                ),
                              ),
                            );
                          },
                          account: savedUserPasswordDetails[index]['account'],
                          password: "*" *
                              (savedUserPasswordDetails[index]['password']
                                  .toString()
                                  .length),
                          passwordForCopy: savedUserPasswordDetails[index]
                              ['password'],
                        ),
                      );
                    },
                  ),
          )
        ],
      ),
    );
  }
}
