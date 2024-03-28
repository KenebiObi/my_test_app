import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_test_app/modules/user_details.dart';

class SavedPasswordTileWidget extends StatefulWidget {
  SavedPasswordTileWidget({
    required this.altFunction,
    required this.userdetail,
    required this.passwordForCopy,
    required this.index,
    Key? key,
  }) : super(key: key);

  final void Function() altFunction;
  final UserDetails userdetail;
  final String passwordForCopy;
  final int index;

  @override
  State<SavedPasswordTileWidget> createState() =>
      _SavedPasswordTileWidgetState();
}

class _SavedPasswordTileWidgetState extends State<SavedPasswordTileWidget> {
  late bool _isVisible;

  @override
  void initState() {
    super.initState();
    _isVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.error,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        width: MediaQuery.of(context).size.width * 0.90,
        height: 70.0,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColorLight,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 150.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.userdetail.account,
                        style: const TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                      // const Spacer(),
                      Text(
                        _isVisible
                            ? widget.userdetail.password
                            : '*' * widget.userdetail.password.length,
                        softWrap: true,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _isVisible = !_isVisible;
                      });
                    },
                    icon: Icon(
                      !_isVisible ? Icons.visibility : Icons.visibility_off,
                      size: 20.0,
                      color: !_isVisible ? Colors.white : Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
            // Column(
            //   children: [
            //     Spacer(),
            //     Row(
            //       children: [
            //         Icon(
            //           CupertinoIcons.back,
            //           color: Theme.of(context).colorScheme.tertiary,
            //         ),
            //         Text(
            //           "Swipe to delete",
            //           style: TextStyle(
            //             fontSize: 12.0,
            //             color: Theme.of(context).colorScheme.tertiary,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ],
            // ),
            Row(
              children: [
                IconButton(
                  onPressed: widget.altFunction,
                  icon: const Icon(Icons.edit),
                ),
                IconButton(
                  onPressed: () {
                    Clipboard.setData(
                      ClipboardData(text: widget.passwordForCopy),
                    ).then(
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
                  },
                  icon: const Icon(Icons.copy),
                ),
              ],
            ),
          ],
        ),
      ),
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

