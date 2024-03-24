import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_test_app/widgets/add_pass_acco_dialog.dart';

class SavedPasswordTileWidget extends StatelessWidget {
  SavedPasswordTileWidget(this.altFunction, this.account, this.password,
      {super.key});

  final void Function() altFunction;
  final String account;
  final String password;
  final TextEditingController accountController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12.0),
          width: double.infinity,
          height: 70.0,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColorLight,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    account,
                    style: const TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    password,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                ],
              ),
              // const Spacer(),
              Row(
                children: [
                  IconButton(
                    onPressed: altFunction,
                    icon: const Icon(Icons.edit),
                  ),
                  IconButton(
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: password)).then(
                        (_) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text("Password Copied!"),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text(
                                    "Ok",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                      ;
                    },
                    icon: const Icon(Icons.copy),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 10.0),
      ],
    );
  }
}

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class SavedPasswordTileWidget extends StatelessWidget {
//   SavedPasswordTileWidget(this.account, this.password, {super.key});

//   final String account;
//   final String password;

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Column(
//           children: [
//             Container(
//               padding: const EdgeInsets.all(12.0),
//               width: double.infinity,
//               height: 70.0,
//               decoration: BoxDecoration(
//                 color: Theme.of(context).primaryColorLight,
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     account,
//                     style: const TextStyle(
//                       fontSize: 20.0,
//                     ),
//                   ),
//                   Spacer(),
//                   Text(
//                     "*" * password.length,
//                     style: TextStyle(
//                       color: Theme.of(context).colorScheme.tertiary,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 10.0),
//           ],
//         ),
//         Positioned(
//           top: 10.0,
//           right: 10.0,
//           child: GestureDetector(
//             onTap: () {
//               Clipboard.setData(ClipboardData(text: password)).then(
//                 (_) {
//                   showDialog(
//                     context: context,
//                     builder: (context) => AlertDialog(
//                       title: const Text("Password Copied!"),
//                       actions: [
//                         TextButton(
//                           onPressed: () => Navigator.pop(context),
//                           child: const Text(
//                             "Ok",
//                             style: TextStyle(
//                               fontSize: 20.0,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               );
//               ;
//             },
//             child: Container(
//               width: 80.0,
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 12.0,
//                 vertical: 2.5,
//               ),
//               decoration: BoxDecoration(
//                 color: Theme.of(context).colorScheme.primary,
//                 borderRadius: BorderRadius.circular(10.5),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Icon(
//                     color: Theme.of(context).colorScheme.onPrimary,
//                     Icons.copy,
//                     size: 20.0,
//                   ),
//                   Text(
//                     "Copy",
//                     style: TextStyle(
//                       color: Theme.of(context).colorScheme.onPrimary,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

