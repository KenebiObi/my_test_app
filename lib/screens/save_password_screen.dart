import 'package:flutter/material.dart';
import 'package:my_test_app/modules/database_service.dart';
import 'package:my_test_app/modules/user_details.dart';
import 'package:my_test_app/modules/user_password.dart';
import 'package:my_test_app/widgets/save_pass_bottom_sheet.dart';
import 'package:my_test_app/widgets/save_screen_add_pass_dialog.dart';
import 'package:my_test_app/widgets/saved_password_tile.dart';

class SavePasswordScreen extends StatefulWidget {
  SavePasswordScreen({required saveDetails});

  @override
  State<SavePasswordScreen> createState() => _SavePasswordScreenState();
}

class _SavePasswordScreenState extends State<SavePasswordScreen> {
  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _editAccountController = TextEditingController();
  final TextEditingController _editPasswordController = TextEditingController();

  final DataBaseServices _databaseServices = DataBaseServices();

  bool isVisible = false;

  @override
  void dispose() {
    _accountController.dispose();
    _passwordController.dispose();
    _editAccountController.dispose();
    _editPasswordController.dispose();
    super.dispose();
  }

  void restoreDeletedUserDetails(
    List userDetails,
    String userdetailId,
    UserDetails userdetail,
    int index,
  ) {
    if (index >= 0 && index < userDetails.length) {
      print("Deleted");
      setState(() {
        try {
          // Show a SnackBar to notify the user and provide an option to undo the deletion
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: const Duration(seconds: 4),
              content: const Text("Password deleted"),
              action: SnackBarAction(
                label: "Undo",
                onPressed: () async {
                  // Add the deleted password back to Firestore
                  _databaseServices.addUserDetails(userdetail);
                },
              ),
              dismissDirection: DismissDirection.horizontal,
            ),
          );
        } catch (error) {
          // Handle error
          print("Error deleting password: $error");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Failed to delete password: $error"),
            ),
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
          // This is the part the that contains all ive been following from the video
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.70,
            width: double.infinity,
            child: StreamBuilder(
              stream: _databaseServices.getUsserDetails(),
              builder: (ctx, snapshot) {
                List userDetails = snapshot.data?.docs ?? [];
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  print(snapshot.error);
                  return const Center(
                    child: Text("Error fetching data"),
                  );
                } else if (!snapshot.hasData || snapshot.data == null) {
                  return const Center(
                    child: Text("Nothing here"),
                  );
                } else {
                  // List userdetails = snapshot.data?.docs ?? [];
                  print(userDetails);
                  if (userDetails.isEmpty) {
                    return const Center(
                      child: Text("Nothing here"),
                    );
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: userDetails.length,
                    itemBuilder: (ctx, index) {
                      UserDetails userdetail = userDetails[index].data();
                      String userdetailId = userDetails[index].id;
                      print(userdetail.password);
                      return Column(
                        children: [
                          Dismissible(
                            // background: Container(
                            //   color: Theme.of(context)
                            //       .colorScheme
                            //       .error, // Specify the desired background color
                            //   alignment: Alignment.centerRight,
                            //   padding: EdgeInsets.symmetric(horizontal: 20),
                            //   child: Icon(Icons.delete, color: Colors.white),
                            // ),
                            key: ValueKey(userDetails[index]),
                            onDismissed: (direction) {
                              setState(() {
                                _databaseServices
                                    .deleteUserDetails(userdetailId);
                                restoreDeletedUserDetails(
                                  userDetails,
                                  userdetailId,
                                  userdetail,
                                  index,
                                );
                              });
                            },
                            child: SavedPasswordTileWidget(
                              altFunction: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => SaveScreenAddPassDialog(
                                    controller: _editAccountController,
                                    password: _editPasswordController,
                                    executable: () {
                                      setState(() {
                                        UserDetails updatedUserDetails =
                                            userdetail.copyWith(
                                          account: _editAccountController.text
                                              .trim(),
                                          password: _editPasswordController.text
                                              .trim(),
                                        );
                                        _databaseServices.updateUserDetails(
                                          userdetailId,
                                          updatedUserDetails,
                                        );
                                      });
                                    },
                                  ),
                                );
                              },
                              userdetail: userdetail,
                              passwordForCopy: userdetail.password,
                              index: 1,
                            ),
                          ),
                          const SizedBox(height: 15.0),
                        ],
                      );
                    },
                  );
                  ;
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
