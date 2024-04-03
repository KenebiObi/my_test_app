import 'package:flutter/material.dart';

class OTPVerificationTextField extends StatelessWidget {
  const OTPVerificationTextField(
      {super.key,
      required this.otpVerificationTextFieldController,
      required this.isLast});
  final TextEditingController otpVerificationTextFieldController;
  final bool isLast;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 62.0,
          height: 85.0,
          child: TextFormField(
            controller: otpVerificationTextFieldController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter a valid number";
              }
              return null;
            },
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              }
            },
            // obscureText: true,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'Lexend',
              fontWeight: FontWeight.w500,
              fontSize: 24,
              color: Colors.black,
            ),
            textInputAction:
                !isLast ? TextInputAction.next : TextInputAction.done,
            maxLength: 1,
            keyboardType: TextInputType.number,
            cursorWidth: 1.5,
            cursorColor: Theme.of(context).colorScheme.primary,
            decoration: InputDecoration(
              counterText: "",
              contentPadding: const EdgeInsets.symmetric(
                vertical: 15.0,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
