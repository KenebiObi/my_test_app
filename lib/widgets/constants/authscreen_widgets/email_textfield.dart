import 'package:flutter/material.dart';

class EmailTextfield extends StatefulWidget {
  const EmailTextfield({
    super.key,
    required this.emialController,
  });
  final TextEditingController emialController;

  @override
  State<EmailTextfield> createState() => _EmailTextfieldState();
}

class _EmailTextfieldState extends State<EmailTextfield> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 50.0,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight,
        borderRadius: BorderRadius.circular(20.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        controller: widget.emialController,
        validator: (value) {
          if (value == null || value.isEmpty || !value.contains("@")) {
            return "Please enter a valid email";
          }
          return null;
        },
        keyboardType: TextInputType.emailAddress,
        style: const TextStyle(
          fontFamily: "Karla",
          fontSize: 18.0,
        ),
        decoration: InputDecoration(
          labelText: "Email Address",
          labelStyle: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
