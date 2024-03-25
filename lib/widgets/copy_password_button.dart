import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CopyPasswordButton extends StatelessWidget {
  CopyPasswordButton({required this.clipBoardText, super.key});
  String clipBoardText;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Clipboard.setData(
          ClipboardData(text: clipBoardText),
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
      child: Container(
        height: 80.0,
        width: 80.0,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: const Icon(
          Icons.content_copy,
          size: 30.0,
        ),
      ),
    );
  }
}