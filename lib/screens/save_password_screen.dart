// import 'package:flutter/material.dart';
// import 'package:my_test_app/modules/user_password.dart';
// import 'package:my_test_app/widgets/gen_screen_add_pass_dialog.dart';
// import 'package:my_test_app/widgets/save_pass_bottom_sheet.dart';
// import 'package:my_test_app/widgets/save_screen_add_pass_dialog.dart';
// import 'package:my_test_app/widgets/saved_password_tile.dart';

// class SavePasswordScreen extends StatefulWidget {
//   SavePasswordScreen([saveDetails]);

//   @override
//   State<SavePasswordScreen> createState() => _SavePasswordScreenState();
// }

// class _SavePasswordScreenState extends State<SavePasswordScreen> {
//   final TextEditingController _accountController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   final TextEditingController _editAccountController = TextEditingController();
//   final TextEditingController _editPasswordController = TextEditingController();

//   void deletePassword(int index) {
//     if (index >= 0 && index < savedPasswords.length) {
//       savedPasswords.removeAt(index);
//       ScaffoldMessenger.of(context).clearSnackBars();
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           duration: const Duration(seconds: 4),
//           content: const Text(
//             "Expenses deleted",
//           ),
//           action: SnackBarAction(
//             label: "Undo",
//             onPressed: () {
//               setState(() {
//                 savedPasswords.insert(index, savedPasswords[index]);
//               });
//             },
//           ),
//           dismissDirection: DismissDirection.horizontal,
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final deviceHeight = MediaQuery.of(context).size.height;
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const SizedBox(height: 30.0),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const Text(
//                 "Saved Passwords",
//                 style: TextStyle(
//                   fontSize: 23.0,
//                 ),
//               ),
//               ElevatedButton.icon(
//                 onPressed: () {
//                   showModalBottomSheet(
//                     backgroundColor: Colors.blue[50],
//                     useSafeArea: true,
//                     context: context,
//                     builder: (ctx) => SavePassBottomSheetWidget(
//                       accountController: _accountController,
//                       passwordController: _passwordController,
//                     ),
//                   ).then((_) {
//                     setState(() {});
//                   });
//                 },
//                 icon: const Icon(Icons.add),
//                 label: const Text("Add Password"),
//               )
//             ],
//           ),
//           const SizedBox(height: 20.0),
//           SizedBox(
//             height: deviceHeight - 275,
//             child: savedPasswords.isEmpty
//                 ? const Center(
//                     child: Text(
//                       "No Saved Passwords Yet",
//                       style: TextStyle(fontSize: 20.0),
//                     ),
//                   )
//                 : ListView.builder(
//                     shrinkWrap: true,
//                     itemCount: savedPasswords.length,
//                     itemBuilder: (ctx, index) {
//                       return Dismissible(
//                         key: ValueKey(savedPasswords[index]),
//                         onDismissed: (direction) {
//                           deletePassword(index);
//                         },
//                         child: SavedPasswordTileWidget(
//                           altFunction: () {
//                             print(savedPasswords[index].password.length);
//                             showDialog(
//                               context: context,
//                               builder: (context) => SaveScreenAddPassDialog(
//                                 controller: _editAccountController,
//                                 password: _editPasswordController,
//                                 executable: () => setState(
//                                   () {
//                                     savedPasswords[index].account =
//                                         _editAccountController.text.trim();
//                                     savedPasswords[index].password =
//                                         _editPasswordController.text;
//                                     print(_editPasswordController.text);
//                                   },
//                                 ),
//                               ),
//                             );
//                           },
//                           account: savedPasswords[index].account,
//                           password:
//                               "*" * (savedPasswords[index].password.length),
//                           passwordForCopy: savedPasswords[index].password,
//                         ),
//                       );
//                     },
//                   ),
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore
import 'package:my_test_app/modules/user_password.dart';
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
  final FirebaseFirestore _firestore =
      FirebaseFirestore.instance; // Firestore instance

  @override
  void initState() {
    super.initState();
    // Call a method to fetch passwords from Firestore
    fetchPasswords();
  }

  // Method to fetch passwords from Firestore
  Future<void> fetchPasswords() async {
    try {
      final querySnapshot = await _firestore.collection('passwords').get();
      final List<UserPassword> passwords = querySnapshot.docs.map((doc) {
        final data = doc.data();
        return UserPassword(
          account: data['account'] ?? '',
          password: data['password'] ?? '',
          userId: '',
        );
      }).toList();
      setState(() {
        savedPasswords = passwords; // Update savedPasswords list
      });
    } catch (e) {
      print('Error fetching passwords: $e');
      // Handle error
    }
  }

  void deletePassword(int index) {
    if (index >= 0 && index < savedPasswords.length) {
      setState(() {
        savedPasswords.removeAt(index);
      });
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 4),
          content: const Text("Password deleted"),
          action: SnackBarAction(
            label: "Undo",
            onPressed: () {
              setState(() {
                savedPasswords.insert(index, savedPasswords[index]);
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
                    // When bottom sheet closes, refresh password list
                    fetchPasswords();
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
                      return Dismissible(
                        key: ValueKey(savedPasswords[index]),
                        onDismissed: (direction) {
                          deletePassword(index);
                        },
                        child: SavedPasswordTileWidget(
                          account: savedPasswords[index].account,
                          password: savedPasswords[index].password,
                          altFunction: () {
                            print(savedPasswords[index].password.length);
                            showDialog(
                              context: context,
                              builder: (context) => SaveScreenAddPassDialog(
                                controller: _editAccountController,
                                password: _editPasswordController,
                                executable: () => setState(
                                  () {
                                    savedPasswords[index].account =
                                        _editAccountController.text.trim();
                                    savedPasswords[index].password =
                                        _editPasswordController.text;
                                    print(_editPasswordController.text);
                                  },
                                ),
                              ),
                            );
                          },
                          passwordForCopy: savedPasswords[index].password,
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
