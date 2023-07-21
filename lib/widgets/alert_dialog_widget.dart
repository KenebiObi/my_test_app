import 'package:flutter/material.dart';

class AlertDialogWidget extends StatelessWidget {
  AlertDialogWidget({super.key});

  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: const EdgeInsets.only(
          left: 15.0, right: 15.0, top: 17.0, bottom: 15.0),
      actionsPadding:
          const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
      title: TextFormField(
        controller: textController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
        ),
        // onChanged: (value) {
        //   txtFieldChanged;
        // },
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple[100],
                minimumSize: const Size(115.0, 40.0),
              ),
              onPressed: () => Navigator.pop(context),
              child: const Text(
                "Cancel",
                style: TextStyle(
                  fontSize: 17.0,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple[100],
                minimumSize: const Size(115.0, 40.0),
              ),
              child: const Text(
                "Save",
                style: TextStyle(
                  fontSize: 17.0,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
